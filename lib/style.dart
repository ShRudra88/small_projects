import 'package:flutter/material.dart';

InputDecoration AppInput(String label) // a function of inputdecoration
{
  return InputDecoration(
    contentPadding : EdgeInsets.fromLTRB(20, 10, 10, 20),
    filled: true,
    fillColor: Colors.lime,
    border: OutlineInputBorder(),
    labelText: label
  );
}

TextStyle HeadTextStyle()
{
  return TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}