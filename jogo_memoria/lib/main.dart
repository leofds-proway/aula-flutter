import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      theme: ThemeData(useMaterial3: false),
    ),
  );
}

class Carta {
  late Color color;
  late bool show;
  late bool match;

  Carta({required this.color, this.show=false, this.match=false});
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Carta? cartSel;
  bool comparando = false;

  List<List<Carta>> _baralho = [
    [
      Carta(color: Colors.orange),
      Carta(color: Colors.blue),
      Carta(color: Colors.green),
      Carta(color: Colors.yellow),
    ],[
      Carta(color: Colors.cyan),
      Carta(color: Colors.red),
      Carta(color: Colors.red),
      Carta(color: Colors.green),
    ],[
      Carta(color: Colors.cyan),
      Carta(color: Colors.blue),
      Carta(color: Colors.orange),
      Carta(color: Colors.yellow),
    ]
  ];

  _click(Carta carta) async{
    if(carta.show || carta.match || comparando) {
      return;
    }
    carta.show = true;
    if(cartSel == null){
      cartSel = carta;
    } else {
      comparando = true;
      setState(() {
      });
      await Future.delayed(Duration(milliseconds: 500));

      if(carta.color == cartSel!.color){
        carta.match = true;
        cartSel!.match = true;
      } else {
        carta.show = false;
        cartSel!.show = false;
      }
      cartSel = null;
      comparando = false;
    }
    setState(() {
    });
  }

  _getCarta(Carta carta) {
    return GestureDetector(
      onTap: (){
        _click(carta);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.all(10),
        width: 100,
        height: 100,
        color: carta.show || carta.match ? carta.color : Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int linha = 0; linha < _baralho.length; linha++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int coluna = 0; coluna < _baralho[0].length; coluna++)
                        _getCarta(_baralho[linha][coluna])
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
