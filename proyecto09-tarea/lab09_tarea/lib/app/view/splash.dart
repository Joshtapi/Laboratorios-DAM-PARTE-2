import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SplashPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Cambiado a start
            children: [
              const SizedBox(height: 25),
              Image.asset(
                'assets/foto.png',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 30), // Aumentado el espacio
              const Text(
                'Bienvenido a AppNexus',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 150),
              const Text(
                'Bienvenido a tu app movil , la mejor herramiente para un alumno en la palma de la mano ',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 120),
              ElevatedButton(
                onPressed: () {
                  // Acción cuando se presiona el botón
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
