import 'package:flutter/material.dart';
import 'package:flutter_application_1/mem/dialogView.dart';
import 'package:flutter_application_1/mem/toDoList.dart';


class mainPage extends StatefulWidget {
  
   mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {

  final _controller = TextEditingController();

  List listTodo = [
    ["Exercise", false],
    ["Practice", false],
  ];

void deleteTask(int index){
  setState(() {
    listTodo.removeAt(index);
  });
}

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      listTodo[index][1] = !listTodo[index][1];
    });
  }

  void addNewTask(){
    setState(() {
      listTodo.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

void newTask(){
  showDialog(
    context: context,
    builder: (context) {
      return DialogView(
        controller: _controller,
        onSave: addNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    },
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        title: Center(
          child: Text("TO DO",)),
        backgroundColor: Colors.deepOrange[100],
        elevation: 0.22,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: listTodo.length, 
        itemBuilder: (context,index) {
            return toDoList(
              jobToDo: listTodo[index][0],
              jobComplete: listTodo[index][1],
              onChanged: (value) => checkBoxChanged(value,index),
              deleteTask: (context) => deleteTask(index),
            );
          },
      ),
    );
  }
}

