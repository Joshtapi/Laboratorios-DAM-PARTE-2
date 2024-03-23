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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildCategoryItem('Categoría 1'),
                _buildCategoryItem('Categoría 2'),
                _buildCategoryItem('Categoría 3'),
                _buildCategoryItem('Categoría 4'),
                _buildCategoryItem('Categoría 5'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String categoryName) {
    return ListTile(
      leading: const Icon(Icons.category),
      title: Text(categoryName),
      onTap: () {
        // Acción al seleccionar una categoría
      },
    );
  }
}