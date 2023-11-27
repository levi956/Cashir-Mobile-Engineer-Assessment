import 'package:cashir_assessment/core/core.dart';
import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final VoidCallback? onPressed;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  const BaseText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.onPressed,
    this.textAlign,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (colors) {
        return Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontSize,
            decoration: textDecoration,
            fontWeight: fontWeight,
            color: color ?? colors.alwaysBlack,
          ),
        );
      },
    );
  }
}
