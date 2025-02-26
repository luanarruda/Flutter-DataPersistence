import 'package:alura_flutter/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/flutter.png', 0),
    Task('Andar de Bike', 'assets/images/bike.jpeg', 5),
    Task('Meditar', 'assets/images/meditar.jpeg', 3),
    Task('Ler', 'assets/images/ler.jpg', 4),
    Task('Jogar', 'assets/images/jogar.jpg', 1),
  ];

  void newTask// método
    (String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget )//fica de olho no estado da lista/ da informação)
   {
    return oldWidget.taskList.length != taskList.length;
  }
}

