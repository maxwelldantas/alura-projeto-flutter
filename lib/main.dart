import 'package:alura_projeto_flutter/data/task_inherited.dart';
import 'package:alura_projeto_flutter/screens/initial_screen.dart';
import 'package:alura_projeto_flutter/themes/my_theme.dart';
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
      theme: myTheme,
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}
