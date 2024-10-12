import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = AppTheme.darkTheme;

  void changeTheme() {
    if (currentTheme == AppTheme.darkTheme) {
      currentTheme = AppTheme.lightTheme;
    } else {
      currentTheme = AppTheme.darkTheme;
    }
    notifyListeners();
  }
}
