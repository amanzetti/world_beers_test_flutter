import 'package:flutter/material.dart';

Widget textCard(String text, {TextAlign? textAlign, Color? colorFont}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Syne Mono',
      color: colorFont
    ),
  );
}
