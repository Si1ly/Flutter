import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/toDoDatabase.dart';
import 'package:flutter_application_1/mem/dialogView.dart';
import 'package:flutter_application_1/mem/toDoList.dart';
import 'package:hive/hive.dart';


class mainPage extends StatefulWidget {

  
   mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  final _mybox = Hive.box("mybox");
  final _controller = TextEditingController();
  toDoDatabase db = toDoDatabase();

@override
  void initState() {
    // TODO: implement initState
    if(_mybox.get("TODOLIST") == null){
        db.firstTimeOpen();
    }else{
      db.updateData();
    }
  }
void deleteTask(int index){
  setState(() {
    db.listTodo.removeAt(index);
  });
}

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.listTodo[index][1] = !db.listTodo[index][1];
    });
  }

  void addNewTask(){
    setState(() {
      db.listTodo.add([_controller.text,false]);
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
        itemCount: db.listTodo.length, 
        itemBuilder: (context,index) {
            return toDoList(
              jobToDo: db.listTodo[index][0],
              jobComplete: db.listTodo[index][1],
              onChanged: (value) => checkBoxChanged(value,index),
              deleteTask: (context) => deleteTask(index),
            );
          },
      ),
    );
  }
}

