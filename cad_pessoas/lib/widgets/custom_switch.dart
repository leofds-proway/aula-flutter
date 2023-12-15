
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  CustomSwitch({Key? key, required this.controller, this.onChanged}) : super(key: key);

  CustomSwitchController controller;
  Function? onChanged;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {

  @override
  Widget build(BuildContext context) {
    return Switch(value: widget.controller.selected, onChanged: (value){
      if(widget.onChanged != null){
        widget.onChanged!();
      }
      setState(() {
        widget.controller.selected = value;
      });
    });
  }
}

class CustomSwitchController {
  bool selected;
  CustomSwitchController({this.selected = false});
}
