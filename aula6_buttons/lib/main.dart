import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool sw = true;
  bool cb = true;   // atributo
  List<String> _options = ['opção 1', 'opção 2'];
  double sliderValue = 0;
  // atributo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Buttons'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){},
                child: Text('Click')
            ),
            TextButton(
                onPressed: (){},
                child: Text('Click')
            ),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.photo_camera)
            ),
            Switch(
              value: sw,
              onChanged: (value) {
                print('onChanged $value');
                setState(() {
                  sw = value;
                });
              },
            ),
            Checkbox(
              value: cb,
              onChanged: (bool? value) {
                setState(() {
                  cb = value!;
                });
              },
            ),

            Slider(
              value: sliderValue,        // Valor atual
              max: 100,         // Valor máximo
              //divisions: 5,     // Divisor a cada 5
              onChanged: (double value) {
                setState((){
                  sliderValue = value;
                });
              },
            ),
            DropdownButton<String>(
              hint: Text("Selecione"),
              items: _options.map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem(value: item, child: Text('${item}'));
              }).toList(),
              onChanged: (selected) {
                print(selected);
              },
            ),
            Row()
          ],
        ),
      ),
    );
  }
}


