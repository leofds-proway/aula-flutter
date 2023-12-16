
import 'package:cad_pessoas/model/pessoa.dart';

abstract class PessoaDao {

  Future iniciar();
  Future<Pessoa> salvar(Pessoa pessoa);
  Future excluir(Pessoa pessoa);
  Future atualizar(Pessoa pessoa);
  Future<List<Pessoa>> listar();

}