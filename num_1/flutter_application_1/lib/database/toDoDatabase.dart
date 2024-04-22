import 'package:hive/hive.dart';

class toDoDatabase{
  List listTodo = [];
  final _mybox = Hive.box("mybox");

// the firstime
  void firstTimeOpen(){
    listTodo.add(["Nothing Here",false]);
  }

  void loadData(){
    listTodo = _mybox.get("TODOLIST");
  }
  void updateData(){
    _mybox.put("TODOLIST", listTodo);
  }
}