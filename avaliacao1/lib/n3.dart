
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
        title: Text('App 3'),
      ),
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    color: Colors.cyan,
                    child: Icon(Icons.coffee, size: 120, color: Colors.white,),
                  ),
                ),

              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    color: Colors.orange,
                    child: Icon(Icons.lunch_dining, size: 120, color: Colors.white,),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
