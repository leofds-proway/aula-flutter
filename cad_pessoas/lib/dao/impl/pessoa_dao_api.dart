
import 'package:cad_pessoas/dao/pessoa_dao.dart';
import 'package:cad_pessoas/model/pessoa.dart';
import 'package:dio/dio.dart';

class PessoaDaoApi implements PessoaDao {

  late Dio dio;

  PessoaDaoApi() {
    dio = Dio();
    dio.options.baseUrl = "http://192.168.0.78:3333";
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  @override
  Future atualizar(Pessoa pessoa) async {
    dio.put('/pessoas/${pessoa.id}', data: pessoa.toMap());
  }

  @override
  Future excluir(Pessoa pessoa) async {
    dio.delete('/pessoas/${pessoa.id}');
  }

  @override
  Future iniciar() async {
  }

  @override
  Future<List<Pessoa>> listar() async {
    List<Pessoa> listaPessoas = [];
    try {
      Response response = await dio.get('/pessoas');
      for(var item in response.data) {
        listaPessoas.add(Pessoa.fromMap(item));
      }
    } on DioException catch (e) {
      print(e);
    }
    return listaPessoas;
  }

  @override
  Future<Pessoa> salvar(Pessoa pessoa) async {
    try {
      Response response = await dio.post('/pessoas', data: pessoa.toMap());
      if(response.statusCode == 201) {
        return Pessoa.fromMap(response.data);
      }
    } on DioException catch (e) {
      print(e);
    }
    throw Exception('Falha ao inserir');
  }
}