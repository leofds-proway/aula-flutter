import 'package:cad_pessoas/model/pessoa.dart';
import 'package:cad_pessoas/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Novo extends StatefulWidget {
  Novo({super.key, this.pessoa});

  Pessoa? pessoa;

  @override
  State<Novo> createState() => _NovoState();
}

class _NovoState extends State<Novo> {
  final _nomeController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _esdatoCivilController = CustomSwitchController();
  final _formKey = GlobalKey<FormState>();

  @override
  initState(){
    if(widget.pessoa != null){
      Pessoa pessoa = widget.pessoa!;
      _nomeController.text = pessoa.nome;
      _telefoneController.text = pessoa.telefone;
      _emailController.text = pessoa.email;
      _esdatoCivilController.selected = pessoa.estadoCivil;
    }
  }

  _getTextField(
      {required String label,
      required String hint,
      required final controller,
      List<TextInputFormatter>? textInputFormatterList,
      String? Function(String? value)? validator}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        inputFormatters: textInputFormatterList,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
        validator: validator,
      ),
    );
  }

  String? _validaNome(String? value) {
    if (value != null && value.isEmpty) {
      return 'Campo inválido';
    }
  }

  _esconderTeclado() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  _clickSalvar() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Salvar?'),
          content: Text('Tem certeza que deseja salvar?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _salvar();
                },
                child: Text('Salvar')),
          ],
        ),
      );
    }
  }

  _salvar() {
    String campoNome = _nomeController.text;
    String campoTelefone = _telefoneController.text;
    String campoEmail = _emailController.text;
    bool chaveEstadoCivil = _esdatoCivilController.selected;

    Pessoa pessoa = Pessoa(
      nome: campoNome,
      telefone: campoTelefone,
      email: campoEmail,
      estadoCivil: chaveEstadoCivil,
    );
    if(widget.pessoa != null) {
      pessoa.id = widget.pessoa!.id;
    }

    Navigator.pop(context, pessoa);
  }

  var maskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    String title = widget.pessoa == null ? 'Novo' : 'Editar';
    return Scaffold(
      appBar: AppBar(
        title: Text( title ),
      ),
      backgroundColor: Colors.grey[200],
      body: GestureDetector(
        onTap: () {
          _esconderTeclado();
        },
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0), //<-- SEE HERE
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                _getTextField(
                                    label: 'Nome',
                                    hint: 'Informe seu nome',
                                    controller: _nomeController,
                                    validator: _validaNome),
                                _getTextField(
                                    label: 'Telefone',
                                    hint: 'Informe seu telefone',
                                    controller: _telefoneController,
                                    textInputFormatterList: [maskFormatter]),
                                _getTextField(
                                    label: 'E-mail',
                                    hint: 'Informe seu e-mail',
                                    controller: _emailController),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text('Casado?'),
                                      CustomSwitch(
                                        controller: _esdatoCivilController,
                                        onChanged: () {
                                          _esconderTeclado();
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0, bottom: 8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: _clickSalvar,
                                          child: Text('Salvar'),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
