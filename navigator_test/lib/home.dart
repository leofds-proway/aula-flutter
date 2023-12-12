import 'package:flutter/material.dart';
import 'package:navigator_test/page2.dart';



class Home extends StatelessWidget {
  const Home({super.key});

  _clickGoToPage2(final context){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Page2())
    );

    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => Page2()), (route) => false
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _clickGoToPage2(context);
          },
          child: Text("Page2"),
        ),
      ),
    );
  }
}
