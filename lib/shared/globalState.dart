import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../shared/app_theme.dart';

// is shared to all ViewModels
class GlobalState with ReactiveServiceMixin {
  final AppTheme _appTheme = AppTheme();

  ThemeMode _currentThemeMode = ThemeMode.light;

  ThemeMode get currentThemeMode => _currentThemeMode;

  void toggleThemeMode() {
    if (_currentThemeMode == ThemeMode.light) {
      _currentThemeMode = ThemeMode.dark;
      notifyListeners();
    } else {
      _currentThemeMode = ThemeMode.light;
      notifyListeners();
    }
  }

  Color getPrimaryColor() {
    return _currentThemeMode == ThemeMode.light ? _appTheme.light : _appTheme.dark;
  }

  Color getSecondaryColor() {
    return _currentThemeMode == ThemeMode.light ? _appTheme.dark : _appTheme.light;
  }
}
