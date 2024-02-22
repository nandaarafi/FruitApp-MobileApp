import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants/colors.dart';

class FTextTheme {
  FTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: TextStyle().copyWith(
        fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineSmall: TextStyle().copyWith(
        fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleLarge: TextStyle().copyWith(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleMedium: TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
    titleSmall: TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.7)),
    bodyLarge: TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.black),
    bodyMedium: TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.5)),
    bodySmall: TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: FColors.primary),
    labelLarge: TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black),

    labelMedium: TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w400, color: FColors.primary
    ),
    labelSmall: TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: Color(0xFFA7B296)),
  );
}
