import 'package:flutter/material.dart';
import 'package:navigator_test/page2.dart';



class Home extends StatelessWidget {
  const Home({super.key});

  _clickVaiPage2(final context) async{
    final retorno = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => Page2(texto: "Olá mundo da página 2"))
    );
    print(retorno);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _clickVaiPage2(context);
          },
          child: Text("Page2"),
        ),
      ),
    );
  }
}
