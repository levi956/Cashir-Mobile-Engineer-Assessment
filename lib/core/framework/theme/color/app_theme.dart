import 'package:cashir_assessment/core/framework/theme/color/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final AppColors colors;
  final ThemeMode mode;

  const AppTheme._({
    required this.colors,
    required this.mode,
  });

  factory AppTheme.light() {
    return AppTheme._(
      mode: ThemeMode.light,
      colors: AppColors(
        always161455: const Color(0xFF161455),
        alwaysF5F9FF: const Color(0xFFF5F9FF),
        always767676: const Color(0xFF767676),
        alwaysWhite: Colors.white,
        alwaysBE1414: const Color(0xFFBE1414),
        alwaysBlack: const Color(0xFF181D27),
        alwaysF1F1F1: const Color(0xFFF1F1F1),
        always292D32: const Color(0xFF292D32),
        always181D27: const Color(0xFF181D27),
        alwaysF0FDF4: const Color(0xFFF0FDF4),
        alwaysFEF2F2: const Color(0xFFFEF2F2),
        alwaysABABAB: const Color(0xFFABABAB),
      ),
    );
  }
}
