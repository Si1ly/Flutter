import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homePage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';


void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox("mybox");
  runApp(const mainApp());
  
}

class mainApp extends StatelessWidget {
  
  const mainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainPage(),
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}
