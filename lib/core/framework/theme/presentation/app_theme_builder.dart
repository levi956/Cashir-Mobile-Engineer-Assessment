import 'package:cashir_assessment/core/core.dart';
import 'package:flutter/material.dart';

typedef AppThemeBuilderWidget = Widget Function(AppColors colors);

class AppThemeBuilder extends StatefulWidget {
  final AppThemeBuilderWidget builder;
  const AppThemeBuilder({super.key, required this.builder});

  @override
  State<AppThemeBuilder> createState() => _AppThemeBuilderState();
}

class _AppThemeBuilderState extends State<AppThemeBuilder> with AppThemeMixin {
  @override
  Widget build(BuildContext context) {
    return widget.builder(colors);
  }
}
