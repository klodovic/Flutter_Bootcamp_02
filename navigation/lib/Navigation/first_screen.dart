import 'package:flutter/material.dart';
import 'package:navigation/Navigation/second_screen.dart';

import '../Data/data.dart';
import '../Model/user.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});
  final List<User> people = Data.getALlUsers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
          },
          child: Text("View all ${people.length} users", textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}