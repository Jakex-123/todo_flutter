import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/components/dialog_box.dart';
import 'package:myapp/components/todo_tile.dart';
import 'package:myapp/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _todoBox = Hive.box('TodoBox');
  TodoDB db = TodoDB();

  void initState() {
    if (_todoBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadDb();
    }
    super.initState();
  }

  final _todoController = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.ToDoList[index][1] = !db.ToDoList[index][1];
    });
    db.updateDb();
  }

  void saveNewTask() {
    setState(() {
      db.ToDoList.add([_todoController.text, false]);
      _todoController.clear();
    });
    Navigator.of(context).pop();
    db.updateDb();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _todoController,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.ToDoList.removeAt(index);
    });
    db.updateDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tickify",
        style: GoogleFonts.playfairDisplay(
          fontSize: 30,
          fontWeight: FontWeight.w700
        ),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask, child: const Icon(Icons.add)),
      body: ListView.builder(
          itemCount: db.ToDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.ToDoList[index][0],
              taskCompleted: db.ToDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunc: (context) => deleteTask(index),
            );
          }),
    );
  }
}
