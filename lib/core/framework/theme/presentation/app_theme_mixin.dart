import 'package:cashir_assessment/core/core.dart';
import 'package:cashir_assessment/injectable.dart';
import 'package:flutter/material.dart';

mixin AppThemeMixin<T extends StatefulWidget> on State<T> {
  late AppTheme theme = AppTheme.light();
  late AppColors colors = theme.colors;

  @override
  void initState() {
    getIt<AppThemeController>().stream.listen((theme) {
      if (mounted) {
        setState(() {
          this.theme = theme;
          this.colors = theme.colors;
        });
      }
    });
    super.initState();
  }
}
