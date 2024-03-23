import 'package:flutter/material.dart';
import 'package:laboratorio09/app/view/categories_page.dart';
import 'package:laboratorio09/app/view/favorites_page.dart';
import 'package:laboratorio09/app/view/profile_page.dart';

class BaseScreen extends StatelessWidget {
  final Widget body;
  final int currentIndex;

  const BaseScreen({
    Key? key,
    required this.body,
    required this.currentIndex, required BottomNavigationBar bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Blog Personal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Acción de búsqueda
            },
          ),
        ],
      ),
      body: body,
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
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              // Acción al seleccionar Inicio
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoriesPage(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesPage(),
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}