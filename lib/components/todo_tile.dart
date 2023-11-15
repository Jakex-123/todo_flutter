
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';


class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(BuildContext) deleteFunc;
  Function(bool?)? onChanged;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion:StretchMotion(), children: [
          SlidableAction(
            backgroundColor: Colors.red,
            onPressed: deleteFunc,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12)),
        ]
        ),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: GoogleFonts.arvo(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 20
                )
                ),
            ],
          ),
        ),
      ),
    );
  }
}
