import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_assignment/model/beer.dart';
import 'package:flutter_bloc_assignment/repo/beer_repo.dart';
import 'package:flutter_bloc_assignment/screen/details.dart';
import 'bloc/beer_bloc.dart';
import 'bloc/beer_event.dart';
import 'bloc/beer_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => BeerRepository(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage  extends StatefulWidget {
  const HomePage ({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      BeerBloc(
        RepositoryProvider.of<BeerRepository>(context),)
        ..add(LoadBeerEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('The Beer app'),
            backgroundColor: Colors.amber[800],
          ),
          body: BlocBuilder<BeerBloc, BeerState>(
            builder: (context, state) {
              //when loading
              if (state is BeerLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              //when data is loaded
              if (state is BeerLoadedState) {
                List<Beer> beerList = state.beers;
                return ListView.builder(
                  itemCount: beerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 0,
                      color: Colors.black12,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                            onTap: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Details(beer: beerList[index])))
                            },
                            leading: Image.network(beerList[index].imageUrl),
                            title: Text(beerList[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),),
                            //subtitle: Text(beerList[index].description),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_forever, color: Colors.black45,),
                              tooltip: "Delete Item",
                              onPressed: () {
                                setState(() {
                                  beerList.removeAt(index);
                                });
                              },
                            )
                        ),
                      ),
                    );
                  },
                );
              }

              //when error occur
              if (state is BeerErrorState) {
                return const Center(
                  child: Text("Error", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                );
              }
              return Container();
            },
          )
      ),
    );
  }
}
