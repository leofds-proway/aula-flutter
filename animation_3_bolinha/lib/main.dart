
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Home(),));
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationController2;

  late final Animation<AlignmentGeometry> _animation = Tween<AlignmentGeometry>(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  ).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.decelerate,
    ),
  );

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animationController2 = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
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
            _animationController2.stop();
          }else{
            _animationController.repeat(reverse: true);
            _animationController2.repeat();
          }
        },
        child: Icon(Icons.back_hand),
      ),
      body: Center(
        child: AlignTransition(
          alignment: _animation,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: RotationTransition(
              alignment: Alignment.center,
              child: FlutterLogo(size: 150.0),
              turns: _animationController2,
            ),
            //child: FlutterLogo(size: 150.0),
          ),
        ),
      ),
    );
  }
}
