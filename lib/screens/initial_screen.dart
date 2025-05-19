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

        //FutureBuilder é capaz de carregar informações assíncronas na tela
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;

              switch (snapshot.connectionState) {
                //alt enter no connection ele ja cria os casos faltantes
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando'),
                      ],
                    ),
                  );
                  break;
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando'),
                      ],
                    ),
                  );
                  break;
                case ConnectionState.active:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando'),
                      ],
                    ),
                  );
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      //itemCount verifica o tamanho da nossa lista antes de construir na tela
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          });
                    }
                    return Center(
                        child: Column(
                      children: [
                        Icon(Icons.error_outline, size: 128),
                        Text(
                          'Não há nenhuma Tarefa',
                          style: TextStyle(fontSize: 32),
                        ),
                      ],
                    ));
                  }
                  return Text('Erro ao carregar Tarefas ');
                  break;
              }
              return Text('Erro desconhecido ');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
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
