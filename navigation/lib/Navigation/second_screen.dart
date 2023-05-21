import 'package:flutter/material.dart';
import 'package:navigation/Navigation/third_screen.dart';

import '../Data/data.dart';
import '../Model/user.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});
  final List<User> people = Data.getALlUsers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("People list"),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index){
          User u = people[index];
          return ListTile(
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdScreen(user: u,)))
            },
            leading: CircleAvatar(backgroundColor: Colors.blue,
              child: Text(
                  u.name[0],
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            title: Text(
              u.name,
              style: const TextStyle(color: Colors.black54, fontSize: 20),),
            trailing: Text(
              u.town,
              style: const TextStyle(color: Colors.black54, fontSize: 20),)
          );
        },
      )
    );
  }
}