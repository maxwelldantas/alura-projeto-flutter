import 'package:alura_projeto_flutter/widgets/task.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Tarefas')),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Task('Cafe da manha comendo sucrilhos de chocolate'),
            Task('dsad'),
            Task('sad'),
            Task('Java'),
            Task('Java'),
            Task('Java'),
            Task('Java'),
            Task('Java'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}
