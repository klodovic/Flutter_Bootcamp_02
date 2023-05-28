import 'package:flutter/material.dart';

import '../main.dart';
import '../model/beer.dart';

class Details extends StatelessWidget{
  final Beer beer;
  const Details({ required this.beer, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: ListView(

          children: [
            Image.network(beer.imageUrl, height: 400,),
            Card(
              elevation: 0,
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Text(beer.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 30, color: Colors.amber, fontWeight: FontWeight.bold),),
            ),

            Card(
              elevation: 0,
              margin: const EdgeInsets.symmetric(vertical: 0),
              child: Text(beer.description, textAlign: TextAlign.justify,
                style: const TextStyle(fontFamily: 'RobotoMono', color: Colors.black38, fontSize: 18, ),),
            ),

            Card(
              elevation: 0,
              margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber, // background
                    ),
                    onPressed: () {
                      Navigator.pop(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    },
                    child: const Icon(Icons.arrow_back, color: Colors.white, size: 40,)
                )
            ),


          ],
        ),

        
      )
    );
  }
}