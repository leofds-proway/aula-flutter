import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu App 4'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              _getItem("Linha 1"),
            ],
          ),
          Row(
            children: [
              _getItem("Lado 1", 1),
              _getItem("Lado 2", 2),
            ],
          ),
          Row(
            children: [
              _getItem("Linha 3"),
            ],
          ),
        ],
      ),
    );
  }

  _getItem(String label, [int flexValue = 1]) {
    return Expanded(
      flex: flexValue,
      child: Container(
        margin: EdgeInsets.all(10),
        color: Colors.grey,
        height: 50,
        child: Center(
          child: Text(label, style: TextStyle(color: Colors.white, fontSize: 20),),
        ),
      ),
    );
  }
}
