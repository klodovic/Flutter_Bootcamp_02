import 'package:flutter/material.dart';
import '../data/secure_storage_flutter.dart';


class SecureStorage extends StatefulWidget {
  const SecureStorage ({Key? key}) : super(key: key);

  @override
  State<SecureStorage> createState() => SecureStorageState();
}

class SecureStorageState extends State<SecureStorage > {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.security, color: Colors.amber, size: 110),
                  const SizedBox(height: 10,),
                  const Text("Flutter Secure Storage", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                        hintText: "Enter a word...",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.amber))),),
                  const SizedBox(height: 10,),
                  TextButton(
                    onPressed: () => SecureStorageFlutter().writeData('secure', controller.text),
                    style: TextButton.styleFrom(backgroundColor: Colors.black54, fixedSize: const Size.fromWidth(400)),
                    child: const Text("Store data", style: TextStyle(color: Colors.white, fontSize: 18),),),
                  TextButton(
                    onPressed: () => SecureStorageFlutter().readData('secure'),
                    style: TextButton.styleFrom(backgroundColor: Colors.black54, fixedSize: const Size.fromWidth(400)),
                    child: const Text("Read data", style: TextStyle(color: Colors.white, fontSize: 18),),),
                  TextButton(
                    onPressed: () => SecureStorageFlutter().deleteData('secure'),
                    style: TextButton.styleFrom(backgroundColor: Colors.red[400], fixedSize: const Size.fromWidth(400)),
                    child: const Text("Delete data", style: TextStyle(color: Colors.white, fontSize: 18),),),
                ],
              ),
            ))
    );
  }
}


