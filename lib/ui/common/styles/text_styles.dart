import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const String fontFamily = 'Nunito';

  static const TextStyle titleStyle = TextStyle(
      color: AppColors.black,
      fontSize: 30,
      fontWeight: FontWeight.w900,
      fontFamily: fontFamily);

  static const TextStyle subtitleStyle = TextStyle(
      color: AppColors.black,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: fontFamily);

  static const TextStyle buttonStyle = TextStyle(
      color: AppColors.white,
      fontSize: 20,
      fontFamily: fontFamily);

  static const TextStyle nunitoMedium = TextStyle(
      color: AppColors.black,
      fontSize: 26,
      fontWeight: FontWeight.w700,
      fontFamily: fontFamily);

  static const TextStyle dateSelectorStyle = TextStyle(
      color: AppColors.black,
      fontSize: 30,
      fontWeight: FontWeight.w900,
      fontFamily: fontFamily);
}
