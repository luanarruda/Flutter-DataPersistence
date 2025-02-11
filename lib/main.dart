import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Tarefas')),
        body: ListView(
          children: [
            Task(
                'Aprender Flutter no café da manha jogando bola dando mortal para trás'),
            Task('Andar de bike'),
            Task('Meditar'),
            Task('Meditar'),
            Task('Meditar'),
            Task('Meditar'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String nome;
  const Task(this.nome, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int nivel
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(color: Colors.pink, height: 140),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, //vai alinhar tudo dessa linha, o retangulo
                    children: [
                      Container(
                        color: Colors.black26,
                        width: 72,
                        height: 100,
                      ),
                      Container(
                          width: 200,
                          child: Text(
                            nome,
                            style: TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow
                                  .ellipsis, //coloca tres pontinhos no texto q ficou muito grande
                            ),
                          )),
                      ElevatedButton(
                          onPressed: () {}, child: Icon(Icons.arrow_drop_up)),
                    ],
                  ),
                ),
                Text(
                  'Nivel: o',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
