import 'package:flutter/material.dart';

class FTextShort extends StatelessWidget {
  final String text;
  final TextStyle? font;
  final TextAlign align;

  const FTextShort({
    Key? key,
    required this.text,
    this.font,
    this.align = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: font ?? Theme.of(context).textTheme.bodyLarge,
      textAlign: align,
    );
  }
}