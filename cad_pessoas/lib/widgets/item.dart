
import 'package:cad_pessoas/model/pessoa.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  Item({super.key, required this.pessoa,});

  late Pessoa pessoa;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(pessoa.nome),
      subtitle: Text(pessoa.email),
      leading: Icon(Icons.save, size: 30,),
      trailing: IconButton(
        icon: Icon(Icons.delete, size: 30),
        onPressed: (){
        },
      ),
      onTap: (){
      },
    );
  }
}
