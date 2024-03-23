import 'package:flutter/material.dart';
import 'package:laboratorio09/app/view/categories_page.dart';
import 'package:laboratorio09/app/view/profile_page.dart';
import 'package:laboratorio09/app/view/splash.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Mis Favoritos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                List<String> programmingLanguages = [
                  'Dart',
                  'JavaScript',
                  'Python',
                  'Java',
                  'Swift',
                  'C++',
                  'Ruby',
                  'Kotlin',
                  'TypeScript',
                  'Go'
                ];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text((index + 1).toString()),
                    ),
                    title: Text(
                      programmingLanguages[index],
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(
                      'Descripción de ${programmingLanguages[index]}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _showDeleteConfirmationDialog(context, index);
                      },
                    ),
                    onTap: () {
                      // Acción al seleccionar un elemento de favoritos
                    },
                  ),
                );
              },
            ),
          ),
        ],
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
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashPage(),
                ),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoriesPage(),
                ),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesPage(),
                ),
              );
              break;
            case 3:
              Navigator.pushReplacement(
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

void _showDeleteConfirmationDialog(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Eliminar elemento'),
        content: const Text('¿Estás seguro de eliminar este elemento?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              // Aquí puedes realizar la lógica para eliminar el elemento
              // Puedes utilizar el índice (index) para identificar qué elemento eliminar
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
            child: const Text('Eliminar'),
          ),
        ],
      );
    },
  );
}
