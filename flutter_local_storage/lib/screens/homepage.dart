import 'package:flutter/material.dart';
import 'package:flutter_local_storage/screens/secure_storage.dart';
import 'package:flutter_local_storage/screens/shared_pref.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'hive_screen.dart';



class HomePage extends StatefulWidget{
  const HomePage({Key? key}): super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  int selectedIndex = 0;
  List<Widget> pages = const [
    SharedPref(),
    SecureStorage(),
    HiveScreen()
  ];

  void _navigateButton(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("State management in Flutter"),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: GNav(
        selectedIndex: selectedIndex,
        onTabChange: _navigateButton,
        backgroundColor: Colors.black,
        activeColor: Colors.amber,
        gap: 8,
        tabs: const [
          GButton(icon: Icons.folder_shared, iconColor: Colors.white, text: "Settings",),
          GButton(icon: Icons.security, iconColor: Colors.white, text: "Security",),
          GButton(icon: Icons.hive, iconColor: Colors.white, text: "Hive",),
        ],
      ),
    );
  }
}