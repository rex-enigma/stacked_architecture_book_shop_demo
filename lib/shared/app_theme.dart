import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData _themeData = ThemeData(
    primaryColorLight: Colors.white,
    primaryColorDark: const Color.fromARGB(221, 11, 24, 44),
  );

  Color get light => _themeData.primaryColorLight;
  Color get dark => _themeData.primaryColorDark;
}
