import 'package:flutter/material.dart';

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
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Mis favoritos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text((index + 1).toString()),
                  ),
                  title: Text('Elemento ${index + 1}'),
                  subtitle: Text('Descripción del elemento ${index + 1}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Acción para eliminar el elemento de favoritos
                    },
                  ),
                  onTap: () {
                    // Acción al seleccionar un elemento de favoritos
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}