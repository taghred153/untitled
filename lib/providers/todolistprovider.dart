import 'package:flutter/material.dart';
import 'package:untitled/models/todolistmodel.dart';
import 'package:untitled/services/todolistservice.dart';

class TaskProvider extends ChangeNotifier {
  TaskModel? taskModel;

  Future<void> fetchdata() async {
    taskModel = await TaskService.getData();
    notifyListeners();
  }

  Future<void> addTask(String newTask, bool completed) async {
    await TaskService.addItem(newTask: newTask, completed: completed);
    taskModel?.todos.add({"todo": newTask, "completed": completed});
    taskModel?.total += 1;
    notifyListeners();
  }
}
