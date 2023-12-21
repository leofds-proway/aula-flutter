import 'package:exemplo_inherited_widget/my_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      myData: MyData('Leo'),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inherited Widget'),
        ),
        body: //Text( MyInheritedWidget.of(context).myData.nome )
        Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyData {
  late String nome;
  MyData(this.nome);
}

class MyInheritedWidget extends InheritedWidget {

  MyInheritedWidget({super.key, required this.myData, required super.child});

  final MyData myData;

  static MyInheritedWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  static MyInheritedWidget of(BuildContext context) {
    final MyInheritedWidget? result = maybeOf(context);
    assert(result != null, 'No MyInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) => myData!= oldWidget.myData;
}