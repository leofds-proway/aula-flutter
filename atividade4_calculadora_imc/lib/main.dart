
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
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Informe')
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('IMC')
                  ],
                ),
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
