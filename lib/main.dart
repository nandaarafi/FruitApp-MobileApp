import 'package:flutter/material.dart';
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
      // theme: AppTheme.get(isLight: true),
      // darkTheme: AppTheme.get(isLight: false),
      home: NavigationMenu(),
      // home: MyHomePage(title: 'Animated Navigation Bottom Bar'),
    );
  }
}
