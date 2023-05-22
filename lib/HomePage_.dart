import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

import 'package:todo_app_vol_2/util/newTask.dart';
import 'package:todo_app_vol_2/util/todo_tile.dart';

import 'data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//refrance the hive box
  final _myBox = Hive.box('myBox');
  @override
  void initState() {
    // if this is the first time openning the app
    if (_myBox.get('Todolist') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

//List of to do task
  TodoDatabase db = TodoDatabase();

// checkbox was tapped
  void CheckboxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });

    db.updateData();
  }

//save a new Task
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);

      _controller.clear();
    });
    Navigator.of(context).pop();
  }

//Delete the task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

//text controller
  final _controller = TextEditingController();
//dialoug box
  void createnewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialougBoxx(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(65, 90, 82, 82),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('My Todo Today'),
        backgroundColor: Colors.black87,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: createnewtask),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
              taskname: db.todoList[index][0],
              onChanged: (value) => CheckboxChanged(value, index),
              deleteFunction: (contex) => deleteTask(index),
              taskcomplete: db.todoList[index][1]);
        },
      ),
    );
  }
}
