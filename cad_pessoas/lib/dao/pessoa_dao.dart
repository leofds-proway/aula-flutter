
import 'package:cad_pessoas/model/pessoa.dart';

abstract class PessoaDao {

  Pessoa salvar(Pessoa pessoa);
  excluir(Pessoa pessoa);
  atualizar(Pessoa pessoa);
  List<Pessoa> listar();

}