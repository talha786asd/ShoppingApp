import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final TextAlign? align;

  const TextWidget(
      {Key? key,
      required this.color,
      required this.fontSize,
      this.fontWeight,
      required this.text,
      this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style:
          TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
}
