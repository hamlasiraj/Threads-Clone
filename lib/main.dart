import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'Core/Constant/appcolors.dart';
import 'View/Widget/navigation.dart';

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
        scaffoldBackgroundColor: AppColor.background,
        appBarTheme: AppBarTheme(color: AppColor.background),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColor.titleText),
          headlineMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.titleText),
          headlineSmall: TextStyle(
            fontSize: 19,
            color: AppColor.titleText,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColor.smallText),
          bodyMedium: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColor.smallText),
          bodySmall: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade500,
          ),
          titleSmall: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppColor.titleText),
        ),
      ),
      home: const Navi(),
    );
  }
}
