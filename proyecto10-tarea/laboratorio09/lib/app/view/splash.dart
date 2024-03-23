import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/blog_image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 300,
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Center(
                  child: Text(
                    '¡Bienvenido a mi blog personal!',
                    style: TextStyle(
                      fontFamily: 'Bookman Old Style',
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/linea-de-meta.png'),
                      radius: 40,
                    ),
                    Text('Metas'),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/bombilla.png'),
                      radius: 40,
                    ),
                    Text('Objetivos'),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/gorra.png'),
                      radius: 40,
                    ),
                    Text('Estudios'),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/logro.png'),
                      radius: 40,
                    ),
                    Text('Logros'),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/viajes.png'),
                      radius: 40,
                    ),
                    Text('Viajes'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                textStyle: const TextStyle(fontSize: 20),
                // ignore: deprecated_member_use
                primary: Colors.blue,
                // ignore: deprecated_member_use
                onPrimary: Colors.white,
              ),
              child: const Text('Explorar Publicaciones'),
            ),
            const SizedBox(height: 30),
            Divider(
              height: 20,
              thickness: 2,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 20),
            const Text(
              'Publicaciones Recientes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.all(8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/post.jpg'),
                ),
                title: const Text(
                  'Cómo Aprender Programación desde Cero',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Descubre los pasos y recursos esenciales para empezar a aprender programación, incluso si no tienes experiencia previa en el tema.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  // Acción al seleccionar la publicación
                },
              ),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.all(8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/post.jpg'),
                ),
                title: const Text(
                  'Diseño de Interfaces de Usuario: Principios Básicos',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Explora los fundamentos del diseño de interfaces de usuario y aprende cómo crear experiencias de usuario intuitivas y atractivas.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  // Acción al seleccionar la publicación
                },
              ),
            ),
                        Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.all(8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/post.jpg'),
                ),
                title: const Text(
                  'Herramientas Esenciales para Desarrolladores de Software',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Descubre las herramientas y recursos que todo desarrollador de software debería tener en su caja de herramientas para optimizar su flujo de trabajo y mejorar la productividad.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  // Acción al seleccionar la publicación
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
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
      ),
    );
  }
}
