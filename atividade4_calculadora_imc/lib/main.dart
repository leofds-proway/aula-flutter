
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Home(),));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _alturaController = TextEditingController();
  final _pesoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.amber[100],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/boy.png', height: 100,),
                const Text('Informe'),
                const Text('IMC'),
                Row(
                  children: [
                    Expanded(child: TextField(
                      controller: _alturaController,
                    )),
                    const SizedBox(width: 20,),
                    Expanded(child: TextField(
                      controller: _pesoController,
                    )),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: ElevatedButton(
                      onPressed: _clickCalcular,
                      child: const Text('Calcular'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _clickCalcular(){

  }
}
