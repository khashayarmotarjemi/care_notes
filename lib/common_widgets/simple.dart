import 'package:care_notes/constants.dart';
import 'package:flutter/material.dart';

class ThinDivider extends StatelessWidget {
  const ThinDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Constants.gray1,
      width: double.infinity,
    );
  }
}
