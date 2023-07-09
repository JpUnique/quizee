import 'package:flutter/material.dart';

class AppColor {
  static const int primaryColorValue = 0xffe5e600;

  static const Color primary = Color(primaryColorValue);

  static const MaterialColor primarySwatch = MaterialColor(
    primaryColorValue,
    {
      50: Color(0xffe56373),
      100: Color(primaryColorValue),
    },
  );
  static const Color wrongAnswer = Color(0xffff0000);
  static const Color rightAnswer = Color(0xff00ff00);
  static const Color unselectedAnswer = Color(0xffffff00);
}