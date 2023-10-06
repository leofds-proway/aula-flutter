import 'package:atividade2/custom_line.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _getItem(
      {required String label,
      required Color backgroundColor,
      Color labelColor = Colors.white,
      required AlignmentGeometry labelAlignment}) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 8),
            alignment: labelAlignment,
            height: 40,
            color: backgroundColor,
            child:
                Text(label, style: TextStyle(fontSize: 20, color: labelColor)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu App 2', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CustomLine(
              label: 'Linha 1',
              backgroundColor: Colors.green,
              labelAlignment: Alignment.centerLeft),

          _getItem(
              label: 'Linha 2',
              backgroundColor: Colors.blue,
              labelAlignment: Alignment.center),

          _getItem(
              label: 'Linha 3',
              backgroundColor: Colors.black,
              labelAlignment: Alignment.centerRight),
        ],
      ),
    );
  }
}
