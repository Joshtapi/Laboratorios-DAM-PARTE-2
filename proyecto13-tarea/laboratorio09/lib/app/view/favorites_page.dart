import 'package:flutter/material.dart';
import 'package:laboratorio09/app/view/categories_page.dart';
import 'package:laboratorio09/app/view/profile_page.dart';
import 'package:laboratorio09/app/view/splash.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importa el paquete shared_preferences

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late SharedPreferences _prefs; // Instancia de SharedPreferences
  final List<String> _favoriteItems = []; // Lista de favoritos

  int _currentIndex = 2; // Índice actual del BottomNavigationBar

  @override
  void initState() {
    super.initState();
    _loadFavorites(); // Cargar favoritos al iniciar la página
  }

  // Función para cargar los favoritos desde SharedPreferences
  Future<void> _loadFavorites() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteItems.clear();
      _favoriteItems.addAll(_prefs.getStringList('favoriteItems') ?? []);
    });
  }

  // Función para guardar los favoritos en SharedPreferences
  Future<void> _saveFavorites() async {
    await _prefs.setStringList('favoriteItems', _favoriteItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Mis Favoritos',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _favoriteItems.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      _favoriteItems[index],
                      style: const TextStyle(fontSize: 18),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewFavoriteItem, // Función para agregar nuevo elemento
        child: const Icon(Icons.add),
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
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Realizar la navegación según la selección
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
              // No es necesario hacer nada ya que estamos en esta página
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

  // Función para agregar nuevo elemento a la lista de favoritos
  void _addNewFavoriteItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newFavoriteItem = '';

        return AlertDialog(
          title: const Text('Agregar nuevo elemento'),
          content: TextField(
            onChanged: (value) {
              newFavoriteItem = value;
            },
            decoration:
                const InputDecoration(hintText: 'Ingrese un nuevo elemento'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _favoriteItems.add(newFavoriteItem);
                });
                _saveFavorites(); // Guardar la lista actualizada
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  // Función para mostrar diálogo de confirmación para eliminar un elemento
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
                setState(() {
                  _favoriteItems.removeAt(
                      index); // Eliminar elemento de la lista de favoritos
                });
                _saveFavorites(); // Guardar la lista actualizada
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }
}
