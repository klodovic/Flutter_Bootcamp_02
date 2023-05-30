import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'notes_list_screen.dart';

class SharedPref extends StatefulWidget {
  const SharedPref({Key? key}) : super(key: key);

  @override
  State<SharedPref> createState() => SharedPrefState();
}

class SharedPrefState extends State<SharedPref> {
  String? word;
  late List<String> data;
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
        body: Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.mobile_screen_share, size: 100, color: Colors.amber,),
                  const SizedBox(height: 10,),
                  const Text("Shared preferences", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                        hintText: "Enter a word...",
                        enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.amber))),),
                  const SizedBox(height: 20,),
                  TextButton(
                    onPressed: () {_setNotesData(controller.text); controller.text = "";},
                    style: TextButton.styleFrom(backgroundColor: Colors.black54, fixedSize: const Size.fromWidth(400)),
                    child: const Text("Save data", style: TextStyle(color: Colors.white, fontSize: 18),),),
                  TextButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const NotesListScreen()));},
                    style: TextButton.styleFrom(backgroundColor: Colors.black54, fixedSize: const Size.fromWidth(400)),
                    child: const Text("View Notes", style: TextStyle(color: Colors.white, fontSize: 18),),),
                ],
              ),
            ))
    );
  }

  Future<void> _setNotesData(noteValue) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('noteData', noteValue);
  }
}


