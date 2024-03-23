import 'package:flutter/material.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

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
          child: const Center(child: Text('Atrás')), // Se corrigió aquí el uso de 'const'
        ),
      ),
      body: Center(child: Text('Hola, el contador es: $count')), // Se corrigió 'Body' a 'body'
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
