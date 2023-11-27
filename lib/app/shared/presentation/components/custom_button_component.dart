import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:cashir_assessment/core/core.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool expanded;
  final String text;
  final Color? color;
  final BorderRadius? radius;
  final Border? border;
  final VoidCallback onPressed;
  final EdgeInsets? padding;
  final bool Function()? validator;
  final double? width;
  final Color? textColor;
  final bool? smallPadding;
  final Color? borderColor;

  const CustomButton({
    super.key,
    this.expanded = false,
    required this.text,
    this.color,
    required this.onPressed,
    this.padding,
    this.validator,
    this.radius,
    this.border,
    this.width,
    this.textColor,
    this.borderColor,
    this.smallPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (colors) {
        return Container(
          width: width ?? (expanded ? double.maxFinite : null),
          decoration: BoxDecoration(
            borderRadius: radius,
            border: border,
          ),
          child: ElevatedButton(
            onPressed:
                (validator == null ? true : validator!()) ? onPressed : null,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                smallPadding!
                    ? const EdgeInsets.symmetric(
                        horizontal: Spacings.spacing8,
                        vertical: Spacings.spacing10,
                      )
                    : const EdgeInsets.symmetric(
                        horizontal: Spacings.spacing32,
                        vertical: Spacings.spacing16,
                      ),
              ),
              elevation: MaterialStateProperty.all(0.0),
              backgroundColor: (validator == null ? true : validator!())
                  ? MaterialStateProperty.all(color ?? colors.always161455)
                  : MaterialStateProperty.all(
                      (color ?? colors.always161455).withOpacity(0.5),
                    ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: borderColor ?? Colors.transparent,
                  ),
                  borderRadius:
                      radius ?? BorderRadius.circular(Spacings.spacing6),
                ),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: textColor ?? colors.alwaysWhite,
                fontWeight: FontWeight.w600,
                fontSize: TextSizes.size14,
                letterSpacing: 0.5,
              ),
            ),
          ),
        );
      },
    );
  }
}
