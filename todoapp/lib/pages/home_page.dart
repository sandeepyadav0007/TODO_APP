// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/dailog_box.dart';
import 'package:todoapp/util/todotile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  ToDoDataBAse db = ToDoDataBAse();

  @override
  void initState() {
    // if this is the first time ever opening the app then create default data
    if(_myBox.get("TODOLIST")== null){
      db.createInitialData();

    }
    else{
      // already exist data
      db.loadData();
    }
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

 // List of todo tasks

 

 // checkbox was tapped

 void checkBoxChanged(bool? value, int index){
  setState(() {
    
    db.toDoList[index][1]= !db.toDoList[index][1];
  });
  db.updateDataBAse();

 }

// save a new task
 void saveNewTask(){
  setState(() {
    db.toDoList.add([_controller.text, false]);
    _controller.clear();

  });
  Navigator.of(context).pop();
  db.updateDataBAse();
 }


 // create a new task
 void createNewTask(){
  showDialog(context: context, builder: (context){
    return DailogBox(
      controller:_controller ,
      onSave: saveNewTask,
      onCancel: () => Navigator.of(context).pop(),
    );
  });
 }

 // delete a task
 void deleteTask(int index){
  setState(() {
    db.toDoList.removeAt(index);
  });
  db.updateDataBAse();


 }
 
 
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(
          child: Text('TO DO')
        ),

        backgroundColor: Colors.yellow[400],
        elevation: 0,

      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,
      child:Icon(Icons.add)),

      body: ListView.builder(
        itemCount: db.toDoList.length,

        itemBuilder: (context ,index){
          return ToDoTile(taskName: db.toDoList[index][0], 
          taskCompleted: db.toDoList[index][1], 
          onChanged: (value)=>checkBoxChanged(value,index),
          deleteFunction:(context) =>deleteTask(index) ,);

        }),
    );
  }
}