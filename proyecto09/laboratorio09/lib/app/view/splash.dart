import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SplashPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Hola Mundo'),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('ASSETS'),
                    Text('IMAGENES'),
                  ],
                )
              ),
              Image(image:AssetImage('assets/foto.png'), width: 300, height: 300, fit: BoxFit.cover), // Usamos Image.asset para cargar imágenes desde assets
            ],
          ),
        ),
      );
  }
}

