import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  String? _erroEmail;
  String? _erroSenha;

  _sucessoLogin() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Login'),
        content: Text('Sucesso'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok')),
        ],
      ),
    );
  }

  _falhaLogin() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Login'),
        content: Text('Inválido'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok')),
        ],
      ),
    );
  }

  bool _validarCampos(String email, String senha) {
    _erroEmail = null;
    _erroSenha = null;
    if (email.isEmpty) {
      _erroEmail = "E-mail é obrigatório";
    }
    if (senha.isEmpty) {
      _erroSenha = "Senha é obrigatório";
    }
    return _erroEmail == null && _erroSenha == null;
  }

  bool _autenticar(String email, String senha) {
    return email == "leo" && senha == "1234";
  }

  _click() {
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (_validarCampos(email, senha)) {
      if (_autenticar(email, senha)) {
        _sucessoLogin();
      } else {
        _falhaLogin();
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/dog.png',
                  height: 120,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pet House',
                      style: TextStyle(fontSize: 40),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "E-mail",
                      hintText: "Informe seu e-mail",
                      errorText: _erroEmail),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _senhaController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Senha",
                      hintText: "Informe sua senha",
                      errorText: _erroSenha),
                  obscureText: true,
                  //dobscuringCharacter: "*",
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _click,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
