import 'package:flutter/material.dart';
import 'package:fruit_app/core/theme/theme.dart';
import 'package:fruit_app/features/authentication/presentation/screen/onboarding.dart';
import 'package:get/get.dart';

import 'features/navigatiobar/presentation/screen/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      // theme: ThemeData(
      //   primaryColor: Colors.white,
      // ),
      theme: FTheme.lightTheme,
      // darkTheme: AppTheme.get(isLight: false),
      home: OnBoardingScreen(),
      // home: MyHomePage(title: 'Animated Navigation Bottom Bar'),
    );
  }
}
