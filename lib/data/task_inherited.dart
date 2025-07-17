import 'package:alura_projeto_flutter/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required super.child});

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/dash.png', 3),
    Task('Andar de bicicleta na montanha', 'assets/images/bike.jpeg', 2),
    Task('Meditar', 'assets/images/meditar.jpeg', 5),
    Task('Ler', 'assets/images/ler.jpeg', 4),
    Task('Jogar', 'assets/images/jogar.jpeg', 1),
    Task('Assistir TV', 'assets/images/assistir-tv.jpeg', 2),
    Task('Estudar', 'assets/images/estudar.jpeg', 3),
    Task('Descansar', 'assets/images/descansar.jpeg', 0),
    Task('Trabalhar', 'assets/images/trabalhar.jpeg', 5),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context
        .dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
