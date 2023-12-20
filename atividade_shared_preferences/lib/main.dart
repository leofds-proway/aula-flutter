import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(useMaterial3: false),
    ));

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();
  bool _estadoCivil = false;

  @override
  initState(){
    _refresh();
  }

  _refresh(){
    SharedPreferences.getInstance().then((prefs) {
      _nomeController.text = prefs.getString('nome') ?? "";
      _idadeController.text = prefs.getInt('idade')?.toString() ?? "";
      _estadoCivil = prefs.getBool('estadoCivil') ?? false;
      setState(() {
      });
    });
  }

  _clickSalvar() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', _nomeController.text);
    await prefs.setInt('idade', int.parse(_idadeController.text));
    await prefs.setBool('estadoCivil', _estadoCivil);
    _clear();
  }

  _clear(){
    _nomeController.text = "";
    _idadeController.text = "";
    _estadoCivil = false;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
        actions: [
          IconButton(onPressed: _refresh, icon: Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: _nomeController,
                // Especificando um TextEditingController atributo da class
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(), // InputBorder.none
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black)), // Text prefixado no final da caixa de texto
                ) // Ao mudar o conteúdo
                ),
            SizedBox(
              height: 20,
            ),
            TextField(
                controller: _idadeController,
                // Especificando um TextEditingController atributo da class
                decoration: InputDecoration(
                  labelText: 'Idade',
                  border: OutlineInputBorder(), // InputBorder.none
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .black)), // Text prefixado no final da caixa de texto
                ) // Ao mudar o conteúdo
                ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text('Estado Civil'),
                SizedBox(
                  width: 10,
                ),
                Switch(value: _estadoCivil, onChanged: (value) {
                  setState((){
                    _estadoCivil = value;
                  });
                })
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _clickSalvar,
                    child: Text('Salvar'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
