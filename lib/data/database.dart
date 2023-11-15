import 'package:hive_flutter/hive_flutter.dart';

class TodoDB {
  List ToDoList = [
    ["Make Coffee", false],
    ["Study", false]
  ];
  final _todobox = Hive.box('TodoBox');
  void createInitialData() {
    ToDoList = [
      ["Make Coffee", false],
      ["Study", false]
    ];
  }

  void loadDb() {
    ToDoList = _todobox.get("TODOLIST");
  }

  void updateDb() {
    _todobox.put("TODOLIST",ToDoList);
  }
}
