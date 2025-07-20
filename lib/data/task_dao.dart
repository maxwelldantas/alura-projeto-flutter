import 'package:alura_projeto_flutter/components/task.dart';
import 'package:alura_projeto_flutter/data/database.dart';
import 'package:logging/logging.dart';
import 'package:sqflite/sqflite.dart';

class TaskDAO {
  static String tabela =
      '''
        CREATE TABLE $_tableName(
        $_name TEXT,
        $_difficulty INTEGER,
        $_image TEXT
        )
      ''';

  static final String _tableName = 'taskTable';
  static final String _name = 'name';
  static final String _difficulty = 'difficulty';
  static final String _image = 'image';

  save(Task tarefa) async {
    LogRecord(Level.FINE, 'Iniciando o save: ', 'TaskDAO');

    final Database bancoDeDados = await getDatabase();

    var itemExists = await find(tarefa.nome);

    Map<String, dynamic> taskMap = toMap(tarefa);

    if (itemExists.isEmpty) {
      LogRecord(Level.FINE, 'A tarefa ${tarefa.nome} não existia.', 'TaskDAO');

      return await bancoDeDados.insert(_tableName, taskMap);
    } else {
      LogRecord(Level.FINE, 'A tarefa ${tarefa.nome} já existia!', 'TaskDAO');

      return await bancoDeDados.update(
        _tableName,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Future<List<Task>> findAll() async {
    LogRecord(Level.FINE, 'Acessando o findAll: ', 'TaskDAO');

    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tableName,
    );

    LogRecord(
      Level.FINE,
      'Procurando dados no banco de dados... encontrado: $result',
      'TaskDAO',
    );

    return toList(result);
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    LogRecord(Level.FINE, 'Acessando o find: ', 'TaskDAO');

    final Database bancoDeDados = await getDatabase();

    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );

    LogRecord(Level.FINE, 'Tarefa encontrada: ${toList(result)}', 'TaskDAO');

    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    LogRecord(Level.FINE, 'Deletando tarefa: $nomeDaTarefa', 'TaskDAO');

    final Database bancoDeDados = await getDatabase();

    return await bancoDeDados.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
  }

  Map<String, dynamic> toMap(Task tarefa) {
    LogRecord(Level.FINE, 'Convertendo Tarefa em Map:', 'TaskDAO');

    final Map<String, dynamic> mapaDeTarefas = Map();

    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.imagem;

    LogRecord(Level.FINE, 'Mapa de Tarefas: $mapaDeTarefas', 'TaskDAO');

    return mapaDeTarefas;
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    LogRecord(Level.FINE, 'Convertendo to List:', 'TaskDAO');

    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task task = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(task);
    }

    LogRecord(Level.FINE, 'Lista de Tarefas: $tarefas', 'TaskDAO');

    return tarefas;
  }
}
