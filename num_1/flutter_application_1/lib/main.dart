import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homePage.dart';


void main(){
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
