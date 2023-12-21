
import 'package:exemplo_inherited_widget/main.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text( MyInheritedWidget.of(context).myData.nome );
  }
}
