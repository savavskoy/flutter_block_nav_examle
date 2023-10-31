import 'package:flutter/cupertino.dart';

class AppColors {
  static const lightBeige = Color.fromRGBO(255, 239, 239, 1);
  static const black = Color.fromRGBO(0, 0, 0, 1);
  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const darkBlue = Color.fromRGBO(83, 83, 138, 1);

  static const gradientTop = Color(0xFF454581);
  static final gradientMiddle = const Color(0xFF454581).withOpacity(0.8);
  static final gradientBottom = const Color(0xFFFCFCFF).withOpacity(0.9);

  static final primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      gradientTop,
      gradientMiddle,
      gradientBottom,
    ],
  );
}
