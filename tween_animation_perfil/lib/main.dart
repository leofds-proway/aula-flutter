import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TweenAnimation'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Perfil()));
            },
            child: Text('Abrir')),
      ),
    );
  }
}

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  _getName() {
    return Text(
      'Leonardo Fernandes',
      style: TextStyle(color: Colors.white, fontSize: 20),

    );
  }

  _getImage() {
    return Icon(
      Icons.people,
      color: Colors.white,
      size: 100,
    );
  }

  _getText() {
    return Text(
      'alsjudfhl kaushdfk ahsldfuh asdujfh aopisudhfpasuh',
      style: TextStyle(color: Colors.white, fontSize: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    var altura = deviceInfo.size.height/2 + 50;
    var largura = deviceInfo.size.width/2 + 50;
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(seconds: 1),
            curve: Curves.bounceOut,
            child: _getName(),
            builder: (context, value, child) {
              return Transform.translate(
                  offset: Offset(0.0, -altura + (altura * value)), child: child);
            },
          ),
          TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(seconds: 1),
            curve: Curves.bounceOut,
            child: _getImage(),
            builder: (context, value, child) {
              return Transform.translate(
                  offset: Offset(-largura + (largura * value), 0.0), child: child);
            },
          ),
          TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(seconds: 1),
            curve: Curves.bounceOut,
            child: _getText(),
            builder: (context, value, child) {
              return Transform.translate(
                  offset: Offset(0.0, altura + -(altura * value)), child: child);
            },
          ),
        ],
      ),
    );
  }
}
