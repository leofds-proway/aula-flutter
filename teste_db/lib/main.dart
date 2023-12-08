import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:teste_db/pessoa.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(
        useMaterial3: false,
      ),
    ));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Database _db;

  iniciarBanco() async {
    WidgetsFlutterBinding.ensureInitialized();
    _db = await openDatabase(
      join(await getDatabasesPath(), 'teste.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pessoas(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT)',
        );
      },
      version: 1,
    );
  }

  inserir() async {
    Pessoa pessoa = Pessoa(id: null, nome: 'Leonardo');

    await _db.insert(
      'pessoas',
      pessoa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  mostrar() async {
    final List<Map<String, dynamic>> maps = await _db.query('pessoas');
    print(maps);
  }

  @override
  void initState() {
    iniciarBanco().then((_) {
      mostrar();
    });
  }

  _clickAdd(){

  }

  _clickExibir(){
    mostrar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste DB'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.purple),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Nome',
                      border: OutlineInputBorder(), // InputBorder.none
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: _clickAdd,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(60, 55),
                  ),
                  child: const Icon(Icons.add),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _clickExibir,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(0, 55),
                    ),
                    child: const Text(
                      'Exibir',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
