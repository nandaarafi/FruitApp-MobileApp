import 'package:flutter/material.dart';
import 'package:fruit_app/features/home/presentation/screen/home.dart';
import 'package:get/get.dart';

import 'core/utils/constants/text_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: FTextTheme.lightTextTheme,
        // Add other theme properties as needed
      ),// Set this to false

      home: HomeScreen(),
    );
  }
}
