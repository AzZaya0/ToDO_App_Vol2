// ignore_for_file: sort_child_properties_last, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskname;
  final bool taskcomplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile(
      {super.key,
      required this.taskname,
      required this.onChanged,
      required this.taskcomplete,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(
                value: taskcomplete,
                onChanged: onChanged,
                activeColor: Color.fromARGB(255, 255, 2, 2),
              ),

              // task name
              Text(taskname,
                  style: TextStyle(
                      decoration: taskcomplete
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 139, 137, 144),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
