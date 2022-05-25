import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  static const light_blue = Color(0xff36C2F9);
  static const gray1 = Color(0xffD9D9D9);
  static const gray2 = Color(0xffB9B9B9);
  static const gray3 = Color(0xff999999);
  static const dark_blue = Color(0xff4E75CF);
  static const cyan = Color(0xff0AD2D7);
  static const orange = Color(0xffFFA971);
  static const purple = Color(0xffCA72CA);
  static const dark_purple = Color(0xffb23bb2);
  static const light_green = Color(0xffccea8b);
  static const green = Color(0xff38d931);


  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: _tintColor(color, 0.9),
      100: _tintColor(color, 0.8),
      200: _tintColor(color, 0.6),
      300: _tintColor(color, 0.4),
      400: _tintColor(color, 0.2),
      500: color,
      600: _shadeColor(color, 0.1),
      700: _shadeColor(color, 0.2),
      800: _shadeColor(color, 0.3),
      900: _shadeColor(color, 0.4),
    });
  }

  static int _tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color _tintColor(Color color, double factor) => Color.fromRGBO(
      _tintValue(color.red, factor),
      _tintValue(color.green, factor),
      _tintValue(color.blue, factor),
      1);

  static int _shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color _shadeColor(Color color, double factor) => Color.fromRGBO(
      _shadeValue(color.red, factor),
      _shadeValue(color.green, factor),
      _shadeValue(color.blue, factor),
      1);
}
