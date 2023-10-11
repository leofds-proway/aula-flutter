import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _contador = 0;

  _incrementar(){
    setState(() {
      _contador++;
    });
  }

  _decrementar(){
    setState(() {
      _contador--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contador Pessoas',
          style: TextStyle(color: Colors.black, fontFamily: 'SuperDessert'),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/fundo.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_contador',
              style: TextStyle(fontSize: 80, color: (_contador == 10 ? Colors.red : Colors.white)),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 100),
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: (_contador > 0 ? _decrementar : null),
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 100),
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: (_contador < 10 ? _incrementar : null),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
