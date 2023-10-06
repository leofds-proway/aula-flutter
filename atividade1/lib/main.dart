import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home2(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu App 1'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    color: Colors.grey,
                    height: 200,
                    child: Center(
                      child: Text(
                        'Olá',
                        style: TextStyle(color: Colors.white, fontSize: 80),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu App 1'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            color: Colors.grey,
            height: 200,
            child: Center(
              child: Text(
                'Olá',
                style: TextStyle(color: Colors.white, fontSize: 80),
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
