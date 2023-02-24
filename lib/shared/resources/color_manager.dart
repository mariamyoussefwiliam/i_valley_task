import 'package:flutter/material.dart';

class ColorManager {
  static const Color primary = Color(0xff3F51B5);
  static const noConnection = Color(0xf3333436);
  static const Color border = Color(0xffFFD6D5);
  static const Color green = Color(0xff58855B);
  static const Color darkOrange = Color(0xffE96601);
  static const Color lightRed = Color(0xffFF4E4E);
  static const Color black = Color(0xff000000);
  static const Color shadowColor = Color(0xff000000);
  static const Color dividerColor = Color(0xffFF6600);
  static const Color textColor = Color(0xff7E7E7E);
  static const Color darkPrimary = Color(0xff3F51B0);
  static const Color lightPrimary = Color(0xff3F51f0);
  static const Color grey1 = Color(0xff8B8B8B);
  static const Color white = Color(0xffFFFFFF);
  static Color shimmerBase = Colors.grey.shade50;
  static Color shimmerHighlighted = Colors.grey.shade200;
  static const Color perple = Color(0xff8289C0);
  static const MaterialColor color = MaterialColor(
    0xff3F51B5,
    <int, Color>{
      50: Color(0xff3F51B5), //10%
      100: Color(0xff3F51B5), //20%
      200: Color(0xff3F51B5), //30%
      300: Color(0xff3F51B5), //40%
      400: Color(0xff3F51B5), //50%
      500: Color(0xff3F51B5), //60%
      600: Color(0xff3F51B5), //70%
      700: Color(0xff3F51B5), //80%
      800: Color(0xff3F51B5), //90%
      900: Color(0xff3F51B5), //100%
    },
  );
}
