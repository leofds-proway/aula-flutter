import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Page2(heroTag: "A1", url: 'assets/image/fusca.png',)));
            },
            child: Hero(
              tag: "A1",
              child: Image.asset('assets/image/fusca.png',
                  width: 200, height: 100, fit: BoxFit.cover),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Page2(heroTag: "A2", url: 'assets/image/premio.png',)));
            },
            child: Hero(
              tag: "A2",
              child: Image.asset('assets/image/premio.png',
                  width: 200, height: 100, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  Page2({super.key, required this.heroTag, required this.url});

  String heroTag;
  String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carro'),
      ),
      body: Hero(
        tag: heroTag,
        child: Image.asset(this.url),
      ),
    );
  }
}
