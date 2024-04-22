import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  ButtonView({
    super.key, 
    required this.text,
    required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.amber,
      onPressed:onPressed,
      child: Text(text),
      );
  }
}