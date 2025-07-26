import 'package:alura_projeto_flutter/components/task.dart';
import 'package:alura_projeto_flutter/config/logger.dart';
import 'package:alura_projeto_flutter/data/task_dao.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
        ],
        title: Text('Tarefas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0, bottom: 100),
        child: FutureBuilder<List<Task>?>(
          future: TaskDAO().findAll(),
          builder: (context, snapshot) {
            List<Task>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando...'),
                    ],
                  ),
                );
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando...'),
                    ],
                  ),
                );
              case ConnectionState.active:
                return Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando...'),
                    ],
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Task tarefa = items[index];
                        return tarefa;
                      },
                    );
                  }

                  return Center(
                    child: Column(
                      children: [
                        Icon(Icons.error_outline, size: 128),
                        Text(
                          'Não há nenhuma Tarefa',
                          style: TextStyle(fontSize: 32),
                        ),
                      ],
                    ),
                  );
                }

                return Text('Erro ao carregar Tarefas');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (newContext) => FormScreen(taskContext: context),
            ),
          ).then(
            (value) => setState(() {
              logger.i('Recarregando a tela inicial...');
            }),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
