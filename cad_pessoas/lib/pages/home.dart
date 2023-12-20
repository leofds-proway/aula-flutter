import 'package:cad_pessoas/dao/impl/pessoa_dao_db.dart';
import 'package:cad_pessoas/dao/impl/pessoa_dao_memory.dart';
import 'package:cad_pessoas/dao/pessoa_dao.dart';
import 'package:cad_pessoas/model/pessoa.dart';
import 'package:cad_pessoas/pages/novo.dart';
import 'package:cad_pessoas/widgets/item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Pessoa> _listaPessoas = [];
  late PessoaDao _pessoaDao;

  Pessoa? pessoaRemovida;

  @override
  initState() {
    _pessoaDao = PessoaDaoDb();
    _pessoaDao.iniciar().then((_) async {
      _listaPessoas = await _pessoaDao.listar();
      _updateLista();
    });
  }

  _updateLista(){
    _listaPessoas.sort((a,b) {
      return a.nome.toLowerCase().compareTo(b.nome.toLowerCase());
    });
    setState(() {
    });
  }

  _salvar(Pessoa pessoa){
    _pessoaDao.salvar(pessoa).then((pessoaSalva) {
      _listaPessoas.add(pessoaSalva);
      _updateLista();
    });
  }

  _editar(Pessoa pessoa,Pessoa pessoaEditada){
    _pessoaDao.atualizar(pessoaEditada).then((value) {
      _listaPessoas.remove(pessoa);
      _listaPessoas.add(pessoaEditada);
      _updateLista();
    });
  }

  _remover(Pessoa pessoa){
    _pessoaDao.excluir(pessoa).then((value) {
      pessoaRemovida = pessoa;
      _listaPessoas.remove(pessoa);
      _updateLista();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Pessoa removida!'),
            backgroundColor: Colors.grey,
            action: SnackBarAction(
              label: 'Desfazer',
              textColor: Colors.black,
              onPressed: (){
                _salvar(pessoaRemovida!);
              },
            ),
            duration: const Duration(seconds: 3),
          )
      );
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
        _salvar(pessoa);
      }
    });
  }

  _clickEdit(Pessoa pessoa){
    Navigator.push<Pessoa?>(
      context,
      MaterialPageRoute(
        builder: (context) => Novo(pessoa: pessoa),
      ),
    ).then((Pessoa? pessoaEditada) {
      if (pessoaEditada != null) {
        _editar(pessoa, pessoaEditada);
      }
    });
  }

  _clickRemover(Pessoa pessoa){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Remover?'),
        content: Text('Tem certeza que deseja remover o(a) ${pessoa.nome} ?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _remover(pessoa);
              },
              child: Text('Remover')),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    print(_listaPessoas);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cad Pessoas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clickAdd,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.only(top: 10.0),
          itemCount: _listaPessoas.length,
          itemBuilder: (context, index) {
            Pessoa p = _listaPessoas[index];
            return Item(
              pessoa: p,
              onMenuClick: (MyItem item) {
                switch(item){
                  case MyItem.itemTap:
                  case MyItem.itemEdit:
                    _clickEdit(p);
                    break;
                  case MyItem.itemLongPress:
                  case MyItem.itemDelete:
                    _clickRemover(p);
                    break;
                }
              },
            );
          }),
    );
  }
}
