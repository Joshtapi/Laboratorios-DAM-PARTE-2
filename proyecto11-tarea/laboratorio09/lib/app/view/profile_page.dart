import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Mi perfil',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Nombre: Joshua Tapia'),
          ),
          const ListTile(
            leading: Icon(Icons.email),
            title: Text('Correo: joshtapi@example.com'),
          ),
          const ListTile(
            leading: Icon(Icons.phone),
            title: Text('Teléfono: +1234567890'),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  // Acción para editar el perfil
                },
                child: const Text('Editar perfil'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}