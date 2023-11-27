import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:cashir_assessment/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountActionButton extends StatelessWidget {
  final String text;
  final String image;
  final Color color;
  final Color svgColor;
  final Color textColor;
  final VoidCallback onTap;

  const AccountActionButton(
      {super.key,
      required this.color,
      required this.text,
      required this.svgColor,
      required this.onTap,
      required this.textColor,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (colors) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: Spacings.spacing32,
            padding: const EdgeInsets.symmetric(
              horizontal: Spacings.spacing10,
            ),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(
                Spacings.spacing4,
              ),
            ),
            child: Row(
              children: [
                BaseText(
                  text,
                  fontSize: TextSizes.size14,
                  color: textColor,
                ),
                const SizedBox(width: Spacings.spacing8),
                SvgPicture.asset(
                  image,
                  colorFilter: ColorFilter.mode(
                    svgColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
