
import 'package:cad_pessoas/dao/pessoa_dao.dart';
import 'package:cad_pessoas/model/pessoa.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PessoaDaoDb implements PessoaDao {

  Database? _db;

  @override
  iniciar() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'cad_pessoas.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pessoas(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, email TEXT, telefone TEXT, estado_civil NUMERIC)',
        );
      },
      version: 1,
    );
  }

  @override
  atualizar(Pessoa pessoa) {
    // TODO: implement atualizar
    throw UnimplementedError();
  }

  @override
  excluir(Pessoa pessoa) {
    // TODO: implement excluir
    throw UnimplementedError();
  }

  @override
  List<Pessoa> listar() {
    return [];
  }

  @override
  Pessoa salvar(Pessoa pessoa) {
    // TODO: implement salvar
    throw UnimplementedError();
  }





}