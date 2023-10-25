import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}
  
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _alturaController = TextEditingController();
  final _pesoController = TextEditingController();

  String _mensagem = "Informe sua altura e peso";
  String _imc = "";

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
            padding: const EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/boy.png',
                  height: 200,
                ),
                const SizedBox(height: 20),
                Text(
                  _mensagem,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(_imc),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _alturaController,
                        cursorColor: Colors.black54,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Altura",
                            suffixText: "m",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            labelStyle: TextStyle(color: Colors.black54)),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: _pesoController,
                        cursorColor: Colors.black54,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Peso",
                          suffixText: "kg",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          labelStyle: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _clickCalcular,
                        child: const Text(
                          'Calcular',
                          style: TextStyle(fontSize: 25),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          fixedSize: Size(100, 50),
                          shape: StadiumBorder(),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _clickCalcular() {
    String alturaTxt = _alturaController.text;
    String pesoTxt = _pesoController.text;

    alturaTxt = alturaTxt.replaceAll(',', '.').replaceAll(' ', '');
    pesoTxt = pesoTxt.replaceAll(',', '.').replaceAll(' ', '');

    double? altura = double.tryParse(alturaTxt);
    double? peso = double.tryParse(pesoTxt);

    if(altura != null && peso != null){
      double imc = peso / (altura * altura);
      _imc = 'IMC: ${imc.toStringAsFixed(1)}';

      if(imc < 18.5){
        _mensagem = "Abaixo do peso";
      } else if(imc < 25) {
        _mensagem = "Normal";
      } else if(imc < 30) {
        _mensagem = "Sobrepeso";
      } else if(imc < 40) {
        _mensagem = "Obesidade";
      } else {
        _mensagem = "Obesidade grave";
      }
    }
    setState(() {
    });
  }
}
