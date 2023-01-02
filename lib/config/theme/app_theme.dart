import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';

ThemeData appTheme () {
  return ThemeData(
    primaryColor: AppColor.primary,
    hintColor: AppColor.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
      fontFamily: AppStrings.fontfamily,

    textTheme: const TextTheme(
      button: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
          color: Colors.black,
      )
    )
  );
}