import 'package:flutter/material.dart';

var color1 = Color(0xFF5F6270);
var color2 = Color(0xFF313347);
var colorwhite = Colors.white;
var colorgreen = Colors.green;

myLinerGradient({
  int? color1,
  int? color2,
}) {
  return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(color1!),
        Color(color2!),
      ]);
}
