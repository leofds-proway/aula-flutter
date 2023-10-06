
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Home(),));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu App 2'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Linha 1'),
            ],
          ),
          Row(
            children: [
              Text('Linha 2'),
            ],
          ),
          Row(
            children: [
              Text('Linha 3'),
            ],
          ),
        ],
      ),
    );
  }
}

