
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  Page2({super.key,required this.texto});

  late String texto;

  _clickVoltar(final context){
    Navigator.pop(context, "Exemplo de retorno");
  }

  @override
  Widget build(BuildContext context) {
    return
      // PopScope(
      //   canPop: false,
      //   onPopInvoked: (pop){
      //     Navigator.of(context).pop();
      //     //_clickVoltar(context);
      //   },
      WillPopScope(
      onWillPop: () async {
        _clickVoltar(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Page2'),
        ),
        backgroundColor: Colors.amber,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(texto, style: TextStyle(fontSize: 20),),
              SizedBox(height: 50),
              ElevatedButton(onPressed: (){
                _clickVoltar(context);
              }, child: Text('Voltar')),
            ],
          ),
        ),
      ),
    );
  }
}
