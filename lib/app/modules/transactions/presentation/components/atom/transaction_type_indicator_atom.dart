import 'package:cashir_assessment/app/shared/constants/images/images.dart';
import 'package:cashir_assessment/app/shared/constants/spacings/spacings.dart';
import 'package:cashir_assessment/core/framework/theme/presentation/app_theme_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransactionTypeIndicatorAtom extends StatelessWidget {
  final String transactionType;
  const TransactionTypeIndicatorAtom({
    super.key,
    required this.transactionType,
  });

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (color) {
        return Container(
          padding: const EdgeInsets.all(
            Spacings.spacing8,
          ),
          decoration: BoxDecoration(
            color: transactionType == 'credit'
                ? color.alwaysF0FDF4
                : color.alwaysFEF2F2,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            transactionType == 'credit' ? Svgs.creditArrow : Svgs.debitArrow,
          ),
        );
      },
    );
  }
}
