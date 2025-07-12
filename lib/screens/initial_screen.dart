import 'package:alura_projeto_flutter/components/task.dart' show Task;
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Container(), title: Text('Tarefas')),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: Duration(milliseconds: 800),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Task('Aprender Flutter', 'assets/images/dash.png', 3),
            Task(
              'Andar de bicicleta na montanha',
              'assets/images/bike.jpeg',
              2,
            ),
            Task('Meditar', 'assets/images/meditar.jpeg', 5),
            Task('Ler', 'assets/images/ler.jpeg', 4),
            Task('Jogar', 'assets/images/jogar.jpeg', 1),
            Task('Assistir TV', 'assets/images/assistir-tv.jpeg', 2),
            Task('Estudar', 'assets/images/estudar.jpeg', 3),
            Task('Descansar', 'assets/images/descansar.jpeg', 0),
            Task('Trabalhar', 'assets/images/trabalhar.jpeg', 5),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
