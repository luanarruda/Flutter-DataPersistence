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
        appBar: AppBar(
            leading: Container(),
            title: Text('Tarefas')),
        body: ListView(
          children: [
            Task('Aprender Flutter', 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large', 0),
            Task('Andar de Bike', 'https://images.pexels.com/photos/161172/cycling-bike-trail-sport-161172.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 5),
            Task('Meditar', 'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg', 3),
            Task('Ler', 'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg', 4),
            Task('Jogar', 'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg', 1),
          ],
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(color: Colors.pinkAccent, height: 140),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //vai alinhar tudo dessa linha, o retangulo
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom:2),
                        child: Container(
                          color: Colors.black26,
                          width: 72,
                          height: 100,
                          child: Image.network(widget.foto,
                          fit: BoxFit.cover,)
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 200,
                              child: Text(
                                widget.nome,
                                style: TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow
                                      .ellipsis, //coloca tres pontinhos no texto q ficou muito grande
                                ),
                              )),
                          Row(
                            children: [
                              Icon(
                                  Icons.star,
                                  size:15,
                                  color: (widget.dificuldade >= 1) ? Colors.pinkAccent : Colors.pinkAccent[100] ),
                              Icon(
                                  Icons.star,
                                  size:15,
                                  color: (widget.dificuldade >= 2) ? Colors.pinkAccent : Colors.pinkAccent[100] ),
                              Icon(
                                  Icons.star,
                                  size:15,
                                  color:(widget.dificuldade >= 3) ? Colors.pinkAccent : Colors.pinkAccent[100] ),
                              Icon(
                                  Icons.star,
                                  size:15,
                                  color: (widget.dificuldade >= 4) ? Colors.pinkAccent : Colors.pinkAccent[100] ),
                              Icon(
                                  Icons.star,
                                  size:15,
                                  color: (widget.dificuldade >= 5) ? Colors.pinkAccent : Colors.pinkAccent[100] ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                            onPressed: () {
                              setState((){
                                nivel++;
                              });
                              print(nivel);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text('UP', style: TextStyle(fontSize: 12),)
                              ],
                            )),
                      ),

                    ],
                  ),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade >0 ) ?
                          (nivel/widget.dificuldade)/10 : 1,
                        ),
                          width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Nivel: $nivel',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
