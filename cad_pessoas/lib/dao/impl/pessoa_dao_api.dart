
import 'package:cad_pessoas/dao/pessoa_dao.dart';
import 'package:cad_pessoas/model/pessoa.dart';
import 'package:dio/dio.dart';

class PessoaDaoApi implements PessoaDao {

  final dio = Dio();

  @override
  Future atualizar(Pessoa pessoa) async {
    // TODO: implement atualizar
    throw UnimplementedError();
  }

  @override
  Future excluir(Pessoa pessoa) async {
    dio.delete('https://localhost:3333/pessoas/${pessoa.id}');
  }

  @override
  Future iniciar() async {
  }

  @override
  Future<List<Pessoa>> listar() async {
    // TODO: implement listar
    throw UnimplementedError();
  }

  @override
  Future<Pessoa> salvar(Pessoa pessoa) async {
    // TODO: implement salvar
    throw UnimplementedError();
  }

}