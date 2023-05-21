import 'package:flutter/material.dart';
import 'package:navigation/Navigation/second_screen.dart';
import '../Model/user.dart';

class ThirdScreen extends StatelessWidget {
  final User user;
  const ThirdScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
                Text("Name: ${user.name}", style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),
                Text("Town: ${user.town}", style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
                TextButton(
                  onPressed: (){
                    Navigator.pop(context, MaterialPageRoute(builder: (context) => SecondScreen()));
                  },
                  child: const Icon(Icons.arrow_back_ios, color: Colors.black45, size: 34,
                  )
                ),
            ],
          )
      ),
    );
  }
}