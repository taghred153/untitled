import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/todolistprovider.dart';
import 'package:untitled/screens/addtaskscreen.dart';
import 'package:untitled/widgets/todolistwidget.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "To Do List",
            style: TextStyle(
              color: Colors.teal[400],
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.teal[400],
      body: Container(
        padding: const EdgeInsets.only(
            top: 60,
            left: 20,
            right: 20,
            bottom: 20
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<TaskProvider>(
              builder: (context, value, child) {
                final total = value.taskModel?.total ?? 0;
                return Text(
                  "$total Tasks",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Consumer<TaskProvider>(
                    builder: (context, value, child) {
                      final tasks = value.taskModel?.todos;
                      if (tasks == null) {
                        value.fetchdata();
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            return TaskWidget(
                              taskTitle: tasks[index]["todo"],
                              completed: tasks[index]["completed"],
                            );
                          },
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddTask();
            },
          );
        },
        backgroundColor: Colors.blueAccent[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}