import 'package:flutter/material.dart';

import 'appcolors.dart';

class CustomThemeData with ChangeNotifier {
  ThemeData englishTheme = ThemeData(
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.titleText),
      headlineMedium: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.titleText),
      headlineSmall: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: AppColor.smallText),
      bodyLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: AppColor.smallText),
    ),
  );
}
