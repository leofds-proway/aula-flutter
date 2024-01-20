import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class Carro {
  String heroTag;
  String imageUrl;
  String descricao;

  Carro({required this.heroTag, required this.imageUrl, required this.descricao});
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Carro> _carros = [
    Carro(heroTag: 'C1', imageUrl: 'assets/image/fusca.png', descricao: 'Fusca muito louco'),
    Carro(heroTag: 'C2', imageUrl: 'assets/image/premio.png', descricao: 'Um presente pra vc'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: Row(
        children: [
          for(final itemCarro in _carros)
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Page2(carro: itemCarro,)));
              },
              child: Hero(
                tag: itemCarro.heroTag,
                child: Image.asset(itemCarro.imageUrl,
                    width: 200, height: 100, fit: BoxFit.cover),
              ),
            )
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  Page2({super.key, required this.carro});

  Carro carro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carro'),
      ),
      body: Hero(
        tag: carro.heroTag,
        child: Image.asset(carro.imageUrl),
      ),
    );
  }
}
