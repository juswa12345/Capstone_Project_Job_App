import 'package:flutter/material.dart';

Text text(double size, TextAlign align, bool wrap, String text, [FontWeight? weight]){
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: weight,
    ),
    textAlign: align,
    softWrap: wrap,
  );
}