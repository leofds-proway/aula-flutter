import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(useMaterial3: false),
    ),
  );
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool lado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation1'),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              lado = !lado;
            });
          }, icon: Icon(Icons.refresh))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: lado ? 100 : 200,
                      height: lado ? 100 : 50,
                      color: lado ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AnimatedAlign(
                    curve: Curves.bounceOut,
                    duration: Duration(milliseconds: 500),
                    alignment:  lado ? Alignment.centerLeft : Alignment.centerRight,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
