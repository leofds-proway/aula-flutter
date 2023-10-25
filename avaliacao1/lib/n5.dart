
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

  final _controller = TextEditingController();

  _click(){
    print(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App 5'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  label: Text('Informe seu nome'),
                  border: OutlineInputBorder(),
                )
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed: _click, child: Text('Cadastrar')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
