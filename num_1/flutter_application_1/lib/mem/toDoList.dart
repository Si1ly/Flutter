// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class toDoList extends StatelessWidget {
  final String jobToDo;
  final bool jobComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;
  
  toDoList({
    super.key,
    required this.onChanged,
    required this.jobComplete,
    required this.jobToDo,
    required this.deleteTask,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteTask,
            icon: Icons.delete_outline,
            backgroundColor: Colors.red.shade200,
            borderRadius: BorderRadius.circular(20),)
          ],
        
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(value: jobComplete, onChanged: onChanged, activeColor: Colors.black,),
              Text(
                jobToDo, 
                style: TextStyle(
                  decoration: jobComplete? TextDecoration.lineThrough : TextDecoration.none ),)
              ],
              ),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(12),
              ),
        ),
      ),
    );
  }
}