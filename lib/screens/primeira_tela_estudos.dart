import 'package:flutter/material.dart';

class MyFirstWidget  extends StatelessWidget {
  const MyFirstWidget ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    color: Colors.cyan,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, //alinha os stacks
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Stack(
    alignment: AlignmentDirectional.center,
//alinha os containers do children no centro
    children: [
    Container(
    color: Colors.white,
    width: 100,
    height: 100,
    ),
    Container(
    color: Colors.pink,
    width: 50,
    height: 50,
    ),
    ],
    ),
    Stack(
    alignment: AlignmentDirectional.center,
//alinha os containers do children no centro
    children: [
    Container(
    color: Colors.pink,
width: 100,
height: 100,
),
Container(
color: Colors.white,
width: 50,
height: 50,
),
],
),
Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Container(
color: Colors.pinkAccent,
height: 50,
width: 50,
),
Container(
color: Colors.white,
height: 50,
width: 50,
),
Container(
color: Colors.purple,
height: 50,
width: 50,
),
],
),
Container(
color: Colors.amber,
height: 30,
width: 300,
child: const Text(
'Texto de teste',
style: TextStyle(
color: Colors.black,
fontSize: 27,
),
textAlign: TextAlign.center,
),
),
ElevatedButton(
onPressed: () {
//print('Você apertou o botão');
},
child: const Text('Aperte o botão'))
],
),
);
  }
}
