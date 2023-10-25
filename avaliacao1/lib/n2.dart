
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Home(),));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App 2'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/ant.png', color: Colors.pink, height: 100,),
            SizedBox(height: 40,),
            Text("Inseto", style: TextStyle(color: Colors.white, fontSize: 30),)
          ],
        ),
      ),
    );
  }
}
