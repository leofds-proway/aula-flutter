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

  _click(){
    setState((){
      _contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Aula 4'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$_contador', style: TextStyle(fontSize: 30),),
          Container(
            height: 50,
          ),
          Center(
            child: Container(
              width: 200,
              height: 100,
              child: ElevatedButton(
                onPressed: _click,
                child: Text('Press', style: TextStyle(fontSize: 40),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
