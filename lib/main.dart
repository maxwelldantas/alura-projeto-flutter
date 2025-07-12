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
        appBar: AppBar(leading: Container(), title: Text('Tarefas')),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Task(
              'Aprender Flutter',
              'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
              3,
            ),
            Task(
              'Andar de bicicleta na montanha',
              'https://images.pexels.com/photos/1174103/pexels-photo-1174103.jpeg',
              2,
            ),
            Task(
              'Meditar',
              'https://images.pexels.com/photos/1234035/pexels-photo-1234035.jpeg',
              5,
            ),
            Task(
              'Ler',
              'https://images.pexels.com/photos/1370295/pexels-photo-1370295.jpeg',
              4,
            ),
            Task(
              'Jogar',
              'https://images.pexels.com/photos/3651581/pexels-photo-3651581.jpeg',
              1,
            ),
            Task(
              'Assistir TV',
              'https://images.pexels.com/photos/29148795/pexels-photo-29148795.jpeg',
              2,
            ),
            Task(
              'Estudar',
              'https://images.pexels.com/photos/301920/pexels-photo-301920.jpeg',
              3,
            ),
            Task(
              'Descansar',
              'https://images.pexels.com/photos/258330/pexels-photo-258330.jpeg',
              0,
            ),
            Task(
              'Trabalhar',
              'https://images.pexels.com/photos/1181263/pexels-photo-1181263.jpeg',
              5,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}
