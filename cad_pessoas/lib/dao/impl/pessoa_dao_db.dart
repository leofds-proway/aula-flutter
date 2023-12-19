
import 'package:cad_pessoas/dao/pessoa_dao.dart';
import 'package:cad_pessoas/model/pessoa.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PessoaDaoDb implements PessoaDao {

  final String tabela = "pessoas";
  Database? _db;

  @override
  Future iniciar() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'cad_pessoas.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tabela(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, email TEXT, telefone TEXT, estado_civil NUMERIC)',
        );
      },
      version: 1,
    );
  }

  @override
  Future atualizar(Pessoa pessoa) async {
    await _db!.update(
      tabela,
      pessoa.toMap(),
      where: 'id = ?',
      whereArgs: [pessoa.id],
    );
  }

  @override
  Future excluir(Pessoa pessoa) async {
    await _db!.delete(
      tabela,
      where: 'id = ?',
      whereArgs: [pessoa.id],
    );
  }

  @override
  Future<List<Pessoa>> listar() async {
    final List<Map<String, dynamic>> result = await _db!.query(tabela);
    return result.map((element) => Pessoa.fromMap(element)).toList();
  }

  @override
  Future<Pessoa> salvar(Pessoa pessoa) async {
    pessoa.id = await _db!.insert(tabela, pessoa.toMap());
    return pessoa;
  }
}