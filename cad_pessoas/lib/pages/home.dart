
import 'package:cad_pessoas/pages/novo.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cad Pessoas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Novo())
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          Text('Linha 1', style: TextStyle(fontSize: 20),),
        ],
      ),
    );
  }
}
