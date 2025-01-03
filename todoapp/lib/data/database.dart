import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBAse {
  List toDoList = [];


  // refrence the box
  final _myBox = Hive.box('mybox');


  // run this method if this is the first time ever opening this app
  void createInitialData(){
     toDoList = [
  ["Make Tutorials" ,false],[
    "Do Exercise",false
  ]

 ];

  }

  // load data from database
  void loadData(){
    toDoList = _myBox.get("TODOLIST");

  }

  // update the database
  void updateDataBAse(){

    _myBox.put("TODOLIST", toDoList);

  }

}