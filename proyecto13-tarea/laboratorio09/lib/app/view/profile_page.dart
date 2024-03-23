import 'package:flutter/material.dart';
import 'package:laboratorio09/app/view/ProfileEditPage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mi perfil',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            _buildProfileItem(Icons.person, 'Nombre', 'Joshua Tapia'),
            _buildProfileItem(Icons.email, 'Correo', 'joshtapi@example.com'),
            _buildProfileItem(Icons.phone, 'Teléfono', '+1234567890'),
            const Spacer(), // Espacio entre los elementos y el botón
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _editProfile(context);
                },
                child: const Text('Editar perfil'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorías',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: 3,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // ...código de navegación
        },
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        '$title: $value',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  void _editProfile(BuildContext context) {
    // Supongamos que tienes los datos actuales del perfil
    String currentName = 'Nombre actual';
    String currentEmail = 'correo@actual.com';
    String currentPhone = '+123456789';

    // Navegar a la página de edición del perfil y pasar los datos actuales
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileEditPage(
          currentName: currentName,
          currentEmail: currentEmail,
          currentPhone: currentPhone,
        ),
      ),
    );
  }
}
