
import 'package:cad_pessoas/dao/pessoa_dao.dart';
import 'package:cad_pessoas/model/pessoa.dart';

class PessoaDaoMemory implements PessoaDao {

  List<Pessoa> _listaPessoas = [];

  @override
  atualizar(Pessoa pessoa) {
  }

  @override
  excluir(Pessoa pessoa) {
    _listaPessoas.remove(pessoa);
  }

  @override
  List<Pessoa> listar() {
    return _listaPessoas.map((e) => e).toList();
  }

  @override
  Pessoa salvar(Pessoa pessoa) {
    _listaPessoas.add(pessoa);
    return pessoa;
  }

}