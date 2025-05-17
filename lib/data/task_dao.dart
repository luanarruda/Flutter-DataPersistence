//responsavel por qq responsabilidade de comunicao com o bd
//1° responsabilidade = tabela
import 'package:alura_flutter/data/database.dart';
import 'package:sqflite/sqflite.dart';

import '../components/task.dart';

//nomes com _ pois é privado
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
  Future<List<Task>> findAll() async{
    print('Acessando o FindAll: ');
    final Database bancoDeDados = await getDatabase(); //await pq é um feature, entao tem q esperar o banco de dados ser encontrado ou construido para vincular no nosso db

    //os objetos que vamos pegar do db, vem em tipo de Mapa, ent cada tarefa tem uma imagem, nome, valor especifico
    //a chave do mapa sempre serao strings e os valores podem ser alterados(dynamic)
    //mapa do tpo string e dinamico
    final List<Map<String,dynamic>> result = await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados... encontrado: $result');

    // o metodo find all precisa retornar algo - todo metodo precisa retornar algo
    // por ser feature, demora um tempo para retornar a lista de tarefas
    //na vdd agr retorna mapa (map), entao precisamos transformar
    return toList(result);
  }
  //convertendo a lista em Mapa
  List<Task> toList(List<Map<String,dynamic>> mapaDeTarefas){
    print('COnvertendo to List:');
    final List<Task> tarefas = [];
  // adicionar pra nossa ,isat de tarefas os nossos mapas transformados em tarefas
    for (Map<String,dynamic> linha in mapaDeTarefas){
      //para cada uma das linhas, vamos crar uma tarefa
      //de acordo com os valores do nosso mapa
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }

    //vizualizar tudo isso acontecendo
    print('Lista de tarefas $tarefas');
    return tarefas;
}

  //procura por uma tarefa
  Future<List<Task>> find(String nomeDaTarefa) async{
    print('Acessando fin: ');
    //acessar e abrir o bd igual no find ALl
  }

  //deletar uma tarefa
  delete(String nomeDaTarefa) async{}
  }
