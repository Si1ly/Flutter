import 'package:flutter/material.dart';
import 'package:flutter_application_1/mem/button.dart';

class DialogView extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
    DialogView({super.key, 
    this.controller,
    required this.onCancel,
    required this.onSave});
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Enter Task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonView(text: "Save", onPressed:onSave),
                const SizedBox(width: 10),
                ButtonView(text: "Cancel", onPressed:onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}