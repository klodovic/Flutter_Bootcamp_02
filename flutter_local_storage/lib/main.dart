import 'package:flutter/material.dart';
import 'package:flutter_local_storage/screens/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('products');
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.light(),
      home: const HomePage(),
    );
  }
}


