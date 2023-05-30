import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesListScreen extends StatefulWidget{
  const NotesListScreen({super.key});
  @override
  NotesListScreenState createState() => NotesListScreenState();
}

class NotesListScreenState extends State<NotesListScreen> {
  String? noteValue;

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes List Screen"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
      ),
      body: Center(
        child: noteValue == null ? const Text("No words Available") : Text(noteValue!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,), ),
      ),
    );
  }

void getNotes() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState((){
      noteValue = pref.getString('noteData')!;
    });
  }
}