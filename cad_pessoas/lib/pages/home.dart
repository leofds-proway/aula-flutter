import 'package:cad_pessoas/model/pessoa.dart';
import 'package:cad_pessoas/pages/novo.dart';
import 'package:cad_pessoas/widgets/item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Pessoa> _listaPessoas = [
    Pessoa(nome: 'Leo', email: 'leo@gmail.com'),
    Pessoa(nome: 'Zilda', email: 'zilda@gmail.com')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cad Pessoas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Novo()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(top: 10.0),
          itemCount: _listaPessoas.length,
          itemBuilder: (context, index){
            return Item(pessoa: _listaPessoas[index]);
          }
      ),
    );
  }
}
