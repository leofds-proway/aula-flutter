
import 'package:cad_pessoas/dao/pessoa_dao.dart';
import 'package:cad_pessoas/model/pessoa.dart';

class PessoaDaoMemory implements PessoaDao {

  List<Pessoa> _listaPessoas = [];

  @override
  Future atualizar(Pessoa pessoa) async {
  }

  @override
  Future excluir(Pessoa pessoa) async {
    _listaPessoas.remove(pessoa);
  }

  @override
  Future<List<Pessoa>> listar() async {
    return _listaPessoas.map((e) => e).toList();
  }

  @override
  Future<Pessoa> salvar(Pessoa pessoa) async {
    _listaPessoas.add(pessoa);
    return pessoa;
  }

  @override
  Future iniciar() async {

  }
}