import 'package:alura_flutter/components/task.dart';
import 'package:alura_flutter/data/task_dao.dart';
import 'package:alura_flutter/data/task_inherited.dart';
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
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(), builder: (context, snapshot) {
          List<Task>? items = snapshot.data;
          //itemCount verifica o tamanho da nossa lista antes de construir na tela
          return ListView.builder(itemCount: items.length, itemBuilder: (BuildContext context, int index){
            final Task tarefa =  items[index];
            return tarefa;
          });
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) =>
                  FormScreen(
                    taskContext: context,
                  ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
