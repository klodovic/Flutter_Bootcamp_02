import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_pattern/repository/beer_repository.dart';
import 'package:repository_pattern/repository/repository_providers.dart';
import 'package:repository_pattern/screens/home_page.dart';

Future<void> main() async {
  await RepositoryProviders.initializeProviders();
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


