
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  _clickVoltar(final context){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      backgroundColor: Colors.amber,
      body: Center(
        child: ElevatedButton(onPressed: (){
          _clickVoltar(context);
        }, child: Text('Voltar')),
      ),
    );
  }
}
