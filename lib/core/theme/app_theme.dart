import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/core/theme/app_textstyle.dart';

abstract class AppTheme {
  static final darkTheme = ThemeData(
    dialogBackgroundColor: AppColors.secondaryDark,
    scaffoldBackgroundColor: AppColors.mainDark,
    secondaryHeaderColor: AppColors.secondaryDark,
    textTheme: const TextTheme().copyWith(
      bodySmall: TextStyle(color: Colors.white.withOpacity(0.87)),
      bodyMedium: AppTextstyle.s16w500.copyWith(color: AppColors.character),
      bodyLarge: TextStyle(color: Colors.white.withOpacity(0.87)),
      labelSmall: TextStyle(color: Colors.white.withOpacity(0.87)),
      labelMedium: TextStyle(color: Colors.white.withOpacity(0.87)),
      labelLarge: TextStyle(color: Colors.white.withOpacity(0.87)),
      displaySmall: TextStyle(color: Colors.white.withOpacity(0.87)),
      displayMedium: TextStyle(color: Colors.white.withOpacity(0.87)),
      displayLarge: TextStyle(color: Colors.white.withOpacity(0.87)),
    ),
  );

  static final lightTheme = ThemeData(
    dialogBackgroundColor: AppColors.mainLight,
    scaffoldBackgroundColor: AppColors.mainLight,
    secondaryHeaderColor: AppColors.secondaryLight,
    textTheme: const TextTheme().copyWith(
      bodySmall: const TextStyle(color: AppColors.mainDark),
      bodyMedium: AppTextstyle.s16w500.copyWith(color: AppColors.mainDark),
      bodyLarge: AppTextstyle.s16w400.copyWith(color: AppColors.mainDark),
      labelSmall: const TextStyle(color: AppColors.mainDark),
      labelMedium: const TextStyle(color: AppColors.mainDark),
      labelLarge: const TextStyle(color: AppColors.mainDark),
      displaySmall: const TextStyle(color: AppColors.mainDark),
      displayMedium: const TextStyle(color: AppColors.mainDark),
      displayLarge: const TextStyle(color: AppColors.mainDark),
    ),
  );
}
