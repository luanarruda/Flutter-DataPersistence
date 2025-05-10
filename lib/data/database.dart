import 'package:alura_flutter/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//get database responsavel por procurar onde o
// arquivo foi salvo e abrir esse arquivo (bd)
// caso n existe ele cria
//DAO - objeto de acesso a dados - responsabilidade unica de ter a conversa do banco de dados
Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      //chama a o pacote da tbela do taskDao
      db.execute(TaskDao.tableSql);
    },
    version: 1,
  );
} //caminho definido
