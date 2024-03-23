import 'package:flutter/material.dart';

class H1 extends StatelessWidget {
  const H1(this.text, {super.key,this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: 18, // Tamaño de fuente deseado para el encabezado
        fontWeight: FontWeight.w600,
        color: color // Color del texto
        // Puedes agregar más propiedades de estilo aquí si lo necesitas
      ),
    );
  }
}



