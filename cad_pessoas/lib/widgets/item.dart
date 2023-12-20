import 'package:cad_pessoas/model/pessoa.dart';
import 'package:flutter/material.dart';

enum MyItem { itemEdit, itemDelete, itemTap, itemLongPress }

class Item extends StatelessWidget {
  Item({super.key, required this.pessoa, required this.onMenuClick});

  late Function(MyItem item) onMenuClick;
  late Pessoa pessoa;

  _getPopupMenuItem(){
    return PopupMenuButton<MyItem>(

      onSelected: (MyItem value) {
        onMenuClick(value);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MyItem>>[
        const PopupMenuItem<MyItem>(
          value: MyItem.itemEdit,
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Editar'),
          ),
        ),
        const PopupMenuItem<MyItem>(
          value: MyItem.itemDelete,
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text('Remover'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: Text(pessoa.nome, style: TextStyle(fontSize: 30),)),
              _getPopupMenuItem()
            ],
          ),
        ],
      ),
      //subtitle:  Text(pessoa.email),
      subtitle: Column(
        children: [
          Row(
            children: [
              Text(pessoa.email)
            ],
          ),
          Row(
            children: [
              Expanded(child: Text(pessoa.telefone)),
              Container(
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  // container arredondado
                  color: Colors.grey[
                      400], // com box decoration o container não pode ter color
                ),
                child: Center(
                  child: Text(
                    pessoa.estadoCivil ? 'Casada' : 'Solteira',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      onTap: () {
        onMenuClick(MyItem.itemTap);
      },
      onLongPress: () {
        onMenuClick(MyItem.itemLongPress);
      },
    );
  }
}
