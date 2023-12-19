
import 'package:cad_pessoas/model/pessoa.dart';
import 'package:flutter/material.dart';

enum MyItem { itemEdit, itemDelete, itemTap, itemLongPress }

class Item extends StatelessWidget {
  Item({super.key, required this.pessoa, required this.onMenuClick});

  late Function(MyItem item) onMenuClick;
  late Pessoa pessoa;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(pessoa.nome),
      subtitle: Text(pessoa.email),
      trailing: PopupMenuButton<MyItem>(
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
      ),
      onTap: (){
        onMenuClick(MyItem.itemTap);
      },
      onLongPress: (){
        onMenuClick(MyItem.itemLongPress);
      },
    );
  }
}
