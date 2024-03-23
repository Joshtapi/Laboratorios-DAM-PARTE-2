import 'package:flutter/material.dart';
import 'package:laboratorio09/app/view/components/h1.dart';
import 'package:laboratorio09/app/view/components/shape.dart';
import 'package:laboratorio09/app/view/task_list/task_list_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/Vector.png',
                    width: 141,
                    height: 129,
                  ),
                ],
              ),
              const SizedBox(height: 79),
              Image.asset(
                'assets/images/onboarding-image.png',
                width: 180,
                height: 168,
              ),
              const SizedBox(height: 99),
              Text(
                'Lista de tareas',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 21),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32), // Se corrigió aquí el uso de 'const'
                child: GestureDetector( // Se corrigió aquí el uso de 'GestureDetector'
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TaskListPage()));
                  },
                  child: const Text(
                    'La mejor forma para que no se te olvide nada es anotarlo. Guarda tus tareas y ve completando poco a poco para aumentar tu productividad',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
