
import 'package:cad_pessoas/model/pessoa.dart';

abstract class PessoaDao {

  iniciar();
  Pessoa salvar(Pessoa pessoa);
  excluir(Pessoa pessoa);
  atualizar(Pessoa pessoa);
  List<Pessoa> listar();

}