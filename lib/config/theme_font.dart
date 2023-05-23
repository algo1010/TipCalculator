import 'package:flutter/material.dart';

class ThemeFont {
  static TextStyle bold({double fontSize = 10, Color? color}) {
    return createTextStyle(
      fontSize: fontSize,
      weight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle demibold({double fontSize = 10, Color? color}) {
    return createTextStyle(
      fontSize: fontSize,
      weight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle regular({double fontSize = 10, Color? color}) {
    return createTextStyle(
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle createTextStyle(
      {required double fontSize, FontWeight? weight, Color? color}) {
    return TextStyle(fontSize: fontSize, fontWeight: weight, color: color);
  }
}
