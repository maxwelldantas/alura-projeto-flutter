import 'package:alura_projeto_flutter/data/task_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TaskDAO.tabela);
    },
    version: 1,
  );
}
