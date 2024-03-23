import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hola Mundo App', // Cambiado el título
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tarea - Joshua Tapia'), // Cambiado el título
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Cambiar el color de fondo
      appBar: AppBar(
        backgroundColor: Colors.blue, // Cambiar el color de fondo de la barra
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20, // Cambiar el tamaño del texto
            fontWeight: FontWeight.bold, // Hacer el texto negrita
          ),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hola mundo', // Cambiado el texto
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 16, 95, 126), // Cambiar el color del texto
                fontWeight: FontWeight.bold, // Hacer el texto negrita
              ),
            ),
          ],
        ),
      ),
    );
  }
}
