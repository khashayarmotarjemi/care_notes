import 'package:flutter/material.dart';

class Helper {
  static navigate(BuildContext context, Widget route) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }
}
