import 'package:cad_pessoas/dao/impl/pessoa_dao_db.dart';
import 'package:cad_pessoas/dao/impl/pessoa_dao_memory.dart';
import 'package:cad_pessoas/dao/pessoa_dao.dart';
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
  List<Pessoa> _listaPessoas = [];
  late PessoaDao _pessoaDao;

  @override
  initState() {
    _pessoaDao = PessoaDaoDb();
    _pessoaDao.iniciar().then((_) async {
      _listaPessoas = await _pessoaDao.listar();
      print(_listaPessoas);
      setState(() {});
    });
  }

  _clickAdd() {
    Navigator.push<Pessoa?>(
      context,
      MaterialPageRoute(
        builder: (context) => Novo(),
      ),
    ).then((Pessoa? pessoa) {
      if (pessoa != null) {
        _pessoaDao.salvar(pessoa).then((pessoaSalva) {
          _listaPessoas.add(pessoaSalva);
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cad Pessoas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clickAdd,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(top: 10.0),
          itemCount: _listaPessoas.length,
          itemBuilder: (context, index) {
            return Item(pessoa: _listaPessoas[index]);
          }),
    );
  }
}
