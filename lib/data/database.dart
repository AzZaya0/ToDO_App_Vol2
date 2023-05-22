import 'package:hive/hive.dart';

class TodoDatabase {
  List todoList = [];
  //refrance the box
  final _myBox = Hive.box('myBox');
  // run this method if this is the first time ever openning the app
  void createInitialData() {
    todoList = [
      ['Just Delete me and start your Work', false]
    ];
  }

//load the data from database
  void loadData() {
    todoList = _myBox.get('Todolist');
  }

// update the database
  void updateData() {
    _myBox.put("Todolist", todoList);
  }
}
