import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  Home({super.key});

  final _controller = TextEditingController();

  _salvar(){
    print(_controller.text);

    _controller.text = 'hello';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                  errorText: 'Campo obrigatório',
                labelText: 'E-mail',
                hintText: 'senha',
                border: OutlineInputBorder(), // InputBorder.none
                //enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
                prefixText: 'R\$ ',
                suffixText: 'cm',
                labelStyle: TextStyle(
                  fontSize: 40,
                  color: Color(0xff00d7f3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xff00d7f3),
                      width: 2
                  ),
                ),
                suffixIcon: Icon(Icons.beach_access)
              ),
              //obscureText: true,
              //obscuringCharacter: 's',
              keyboardType: TextInputType.number,

              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.purple
              ),
              onSubmitted: (text){
                _salvar();
              },
              onChanged: (text){
                print(text);
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: _salvar, child: Text('Salvar'))
          ],
        ),
      ),
    );
  }
}
