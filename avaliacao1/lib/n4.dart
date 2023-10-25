
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Home(),));
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App 4'),
      ),
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ElevatedButton(onPressed: (){
              setState(() {
                _contador++;
              });
            }, child: Text('Contar')),
            SizedBox(width: 10,),
            Text('Contagem: $_contador')
          ],
        ),
      ),
    );
  }
}
