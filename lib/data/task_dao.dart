//responsavel por qq responsabilidade de comunicao com o bd
//1° responsabilidade = tabela
import '../components/task.dart';

class TaskDao {
  //"static" tabela vai ter o mesmo valor pra qq instancia de objetocriado com a taskdao
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

//define de fato o nome das categorias
  static const String _tablename = 'taskTable';
  static const String _difficulty = 'difficulty';
  static const String _name = 'name';
  static const String _image = 'image';

  //ações (metodos) do banco de dados que ficarao em outro arquivo

  save(Task tarefa) async {}
  //retorna uma lista de tarefas do bd
  Future<List<Task>> findAll() async{}
  //procura por uma tarefa
  Future<List<Task>> find(String nomeDaTarefa) async{}
  delete(String nomeDaTarefa) async{}
}
