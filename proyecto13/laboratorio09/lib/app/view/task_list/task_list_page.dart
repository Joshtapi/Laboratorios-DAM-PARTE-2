import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laboratorio09/app/model/task.dart';
import 'package:laboratorio09/app/view/components/h1.dart';
import 'package:laboratorio09/app/view/components/shape.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final taskList = <Task>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _loadTaskList(); // Llama a la carga de tareas en el build

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Center(child: Text('Atrás')),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              children: [
                const Row(children: [Shape()]),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/tasks-list-image.png',
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(height: 16),
                    const H1('Completa tus tareas', color: Colors.white),
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 35),
            child: H1('Tareas'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.separated(
                itemCount: taskList.length,
                itemBuilder: (_, index) => _TaskItem(
                  taskList[index],
                  onTap: () {
                    taskList[index].done = !taskList[index].done;
                    setState(() {});
                  },
                ),
                separatorBuilder: (_, __) => const SizedBox(
                  height: 10,
                ), // Agrega el separador entre elementos
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showNewTaskModal,
        child: const Icon(Icons.add, size: 50),
      ),
    );
  }

  Future<void> _loadTaskList() async {
    final prefs = await SharedPreferences.getInstance();
    final taskStrings = prefs.getStringList('tasks');
    setState(() {
      if (taskStrings != null) {
        taskList.clear();
        taskList.addAll(taskStrings.map((e) => Task.fromJson(jsonDecode(e))));
      }
    });
  }

void _showNewTaskModal() {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) => _NewTaskModal(
      onTaskCreated: (Task task) async {
        final prefs = await SharedPreferences.getInstance();
        taskList.add(task);
        prefs.setStringList(
          'tasks',
          taskList.map((e) => jsonEncode(e.toJson())).toList(),
        );

        setState(() {
          taskList.clear();
          taskList.addAll(
            prefs.getStringList('tasks')?.map((e) => Task.fromJson(jsonDecode(e))) ?? [],
          );
        });
      },
    ),
  );
}

}

class _NewTaskModal extends StatelessWidget {
  final void Function(Task task)? onTaskCreated;

  _NewTaskModal({Key? key, this.onTaskCreated}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 33,
        vertical: 23,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(21)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const H1('Nueva tarea'),
          const SizedBox(height: 26),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: 'Descripción de la tarea',
            ),
          ),
          const SizedBox(height: 26),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                final task = Task(_controller.text);
                onTaskCreated!(task);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  final Task task;
  final Function()? onTap;

  const _TaskItem(this.task, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
          child: Row(
            children: [
              Icon(
                task.done
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Text(task.title),
            ],
          ),
        ),
      ),
    );
  }
}
