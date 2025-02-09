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
        home: Container(
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
                child: Text(
                  'Texto de teste',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}
