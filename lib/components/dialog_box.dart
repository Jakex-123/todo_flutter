import 'package:flutter/material.dart';
import 'package:myapp/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key, required this.controller,required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 125,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Add a new Task"),
            controller: controller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Mybutton(text: "Save", onPressed: onSave),
              Mybutton(text: "Cancel", onPressed: onCancel)
            ],
          )
        ]),
      ),
    );
  }
}
