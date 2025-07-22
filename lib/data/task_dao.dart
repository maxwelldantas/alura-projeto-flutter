import 'package:alura_projeto_flutter/components/task.dart';
import 'package:alura_projeto_flutter/config/logger.dart';
import 'package:alura_projeto_flutter/data/database.dart';
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
    logger.i('Iniciando o save: ');

    final Database bancoDeDados = await getDatabase();

    var itemExists = await find(tarefa.nome);

    Map<String, dynamic> taskMap = toMap(tarefa);

    if (itemExists.isEmpty) {
      logger.i('A tarefa ${tarefa.nome} não existia.');

      return await bancoDeDados.insert(_tableName, taskMap);
    } else {
      logger.i('A tarefa ${tarefa.nome} já existia!');

      return await bancoDeDados.update(
        _tableName,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Future<List<Task>> findAll() async {
    logger.i('Acessando o findAll: ');

    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tableName,
    );

    logger.i('Procurando dados no banco de dados... encontrado: $result');

    return toList(result);
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    logger.i('Acessando o find: ');

    final Database bancoDeDados = await getDatabase();

    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );

    logger.i('Tarefa encontrada: ${toList(result)}');

    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    logger.i('Deletando tarefa: $nomeDaTarefa');

    final Database bancoDeDados = await getDatabase();

    return await bancoDeDados.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
  }

  Map<String, dynamic> toMap(Task tarefa) {
    logger.i('Convertendo Tarefa em Map:');

    final Map<String, dynamic> mapaDeTarefas = Map();

    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.imagem;

    logger.i('Mapa de Tarefas: $mapaDeTarefas');

    return mapaDeTarefas;
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    logger.i('Convertendo to List:');

    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task task = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(task);
    }

    logger.i('Lista de Tarefas: $tarefas');

    return tarefas;
  }
}
