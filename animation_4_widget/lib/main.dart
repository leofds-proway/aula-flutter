
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main(){
  runApp(MaterialApp(home: Home(),));
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _getChildWidget() {
    return Icon(Icons.face, size: 200,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation 3'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_animationController.isAnimating){
            _animationController.stop();
          }else{
            _animationController.repeat();
          }
        },
        child: Icon(Icons.back_hand),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          child: Icon(Icons.face, size: 200,),
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
              scale: _animationController.value * 2.0 * math.pi,
              child: child,
            );
            // return Transform.rotate(
            //   angle: _animationController.value * 2.0 * math.pi,
            //   child: child,
            // );
          },
        ),
      ),
    );
  }
}
