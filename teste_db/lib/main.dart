import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:teste_db/pessoa.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Future<Database> _database;

  iniciarBanco() async {
    WidgetsFlutterBinding.ensureInitialized();
    print(join(await getDatabasesPath(), 'teste.db'));
    _database = openDatabase(
      join(await getDatabasesPath(), 'teste.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pessoas(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT)',
        );
      },
      version: 1,
    );
  }

  insert() async {
    final db = await _database;

    Pessoa pessoa = Pessoa(id: null, nome: 'Leonardo');

    await db.insert(
      'pessoas',
      pessoa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  mostrar() async {
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db.query('pessoas');
    print(maps);
  }

  @override
  void initState() {
    iniciarBanco().then((_){
      insert();
      mostrar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste DB'),
        backgroundColor: Colors.blue,
      ),
      body: Container(),
    );
  }
}
