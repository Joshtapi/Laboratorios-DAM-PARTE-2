import 'package:flutter/material.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tareas'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Center(child: Text('Atras'),)
        )
      ),
      // ignore: unnecessary_const
      body: const Center(child: const Text('Hola')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}