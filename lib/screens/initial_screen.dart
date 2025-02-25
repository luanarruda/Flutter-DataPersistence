import 'package:alura_flutter/components/task.dart';
import 'package:alura_flutter/screens/form-screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Container(), title: const Text('Tarefas')),
      body: ListView(
        children: const [
          Task('Aprender Flutter', 'assets/images/flutter.png', 0),
          Task('Andar de Bike', 'assets/images/bike.jpeg', 5),
          Task('Meditar', 'assets/images/meditar.jpeg', 3),
          Task('Ler', 'assets/images/ler.jpg', 4),
          Task('Jogar', 'assets/images/jogar.jpg', 1),
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
