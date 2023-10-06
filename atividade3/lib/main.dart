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
        title: Text('Meu App 3'),
      ),
      body: Center(
        child: Row(
          children: [
            _getItem("Lado 1"),
            _getItem("Lado 2"),
          ],
        ),
      ),
    );
  }

  _getItem(String label) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        color: Colors.grey,
        height: 120,
        child: Center(
          child: Text(label, style: TextStyle(color: Colors.white, fontSize: 20),),
        ),
      ),
    );
  }
}
