import 'package:flutter/material.dart';

class CustomLine extends StatelessWidget {
  String label;
  Color backgroundColor;
  Color labelColor;
  AlignmentGeometry labelAlignment;

  CustomLine(
      {super.key,
      required this.label,
      required this.backgroundColor,
      this.labelColor = Colors.white,
      required this.labelAlignment});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 8),
            alignment: labelAlignment,
            height: 40,
            color: backgroundColor,
            child:
                Text(label, style: TextStyle(fontSize: 20, color: labelColor)),
          ),
        ),
      ],
    );
  }
}
