// import 'package:e_commerce_app/core/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants/text_theme.dart';

class FTheme {
  FTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.yellow,
    scaffoldBackgroundColor: Colors.white,
    textTheme: FTextTheme.lightTextTheme,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent,
      // primary: Colors.blue
    ),

  );
}
//   static ThemeData darkTheme = ThemeData(
//     useMaterial3: true,
//     fontFamily: 'Poppins',
//     brightness: Brightness.dark,
//     primaryColor: Colors.blue,
//     scaffoldBackgroundColor: Colors.black,
//     textTheme: EcomTextTheme.darkTextTheme,
//   );
// }
