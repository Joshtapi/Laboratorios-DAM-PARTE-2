import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Selecciona una categoría:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildCategoryItem(context, 'Tecnología', Colors.orange),
                _buildCategoryItem(context, 'Viajes', Colors.green),
                _buildCategoryItem(context, 'Estilo de vida', Colors.purple),
                _buildCategoryItem(context, 'Cultura', Colors.red),
                _buildCategoryItem(context, 'Negocios', Colors.teal),
              ],
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
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // ...resto del código igual
        },
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String categoryName, Color color) {
    return ListTile(
      leading: const Icon(Icons.category),
      title: Text(categoryName, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetailPage(categoryName: categoryName, color: color),
          ),
        );
      },
    );
  }
}

class CategoryDetailPage extends StatelessWidget {
  final String categoryName;
  final Color color;

  const CategoryDetailPage({Key? key, required this.categoryName, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Container(
        color: color.withOpacity(0.3), // Usamos el color de la categoría con opacidad
        child: Center(
          child: Text(
            'Detalles de la categoría $categoryName',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
