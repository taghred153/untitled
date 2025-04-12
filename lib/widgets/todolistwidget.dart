import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final String taskTitle;
  final bool completed;

  const TaskWidget({
    required this.taskTitle,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: const TextStyle(decoration: TextDecoration.none),
      ),
    );
  }
}
