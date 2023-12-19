


import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home(), theme: ThemeData(useMaterial3: false),));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste PopUpMenuButton'),
      ),
      body: Center(
        child: PopupMenuButton(
          onSelected: (value) => print(value),
          itemBuilder: (context) => <PopupMenuEntry>[
            PopupMenuItem(
              value: 1,
              child: Text('Item 1'),
            ),
            PopupMenuItem(
              value: 2,
              child: Text('Item 2'),
            ),
          ],
        ),
      ),
    );
  }
}
