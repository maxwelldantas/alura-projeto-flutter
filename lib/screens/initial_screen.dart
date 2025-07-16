import 'package:alura_projeto_flutter/components/task.dart' show Task;
import 'package:alura_projeto_flutter/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Tarefas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormScreen()),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
