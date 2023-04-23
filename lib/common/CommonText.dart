import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {

  String text = "";
  Color? color = Colors.black;
  double? fontSize = 15;
  FontWeight? fontWeight = FontWeight.normal;
  TextStyle? customStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: customStyle ?? TextStyle(
        color: color, fontSize: fontSize, fontWeight: fontWeight
      ) ,
    );
  }

  CommonText(
  {required this.text, this.color, this.fontSize, this.fontWeight, this.customStyle , super.key});


}