import 'package:cad_pessoas/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Novo extends StatefulWidget {
  Novo({super.key});

  @override
  State<Novo> createState() => _NovoState();
}

class _NovoState extends State<Novo> {
  final _nomeController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _esdatoCivilController = CustomSwitchController();

  _getTextFieldRow(
      {required String label,
      required String hint,
      required final controller,
      List<TextInputFormatter>? textInputFormatterList}) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              inputFormatters: textInputFormatterList,
              decoration: InputDecoration(
                  labelText: label,
                  hintText: hint,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ),
      ],
    );
  }

  _esconderTeclado(){
    FocusScope.of(context).requestFocus(FocusNode());
  }

  var maskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo'),
      ),
      backgroundColor: Colors.grey[200],
      body: GestureDetector(
        onTap: (){
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
                          borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              _getTextFieldRow(
                                label: 'Nome',
                                hint: 'Informe seu nome',
                                controller: _nomeController,
                              ),
                              _getTextFieldRow(
                                label: 'Telefone',
                                hint: 'Informe seu telefone',
                                controller: _telefoneController,
                                textInputFormatterList: [maskFormatter]
                              ),
                              _getTextFieldRow(
                                label: 'E-mail',
                                hint: 'Informe seu e-mail',
                                controller: _emailController,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('Casado?'),
                                    CustomSwitch(controller: _esdatoCivilController, onChanged: (){
                                      _esconderTeclado();
                                    },)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                        },
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
