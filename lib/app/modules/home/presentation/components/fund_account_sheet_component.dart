import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:cashir_assessment/core/framework/theme/presentation/app_theme_builder.dart';
import 'package:flutter/material.dart';

class FundAccountSheetComponent extends StatelessWidget {
  final String virtualAccount;
  const FundAccountSheetComponent({
    super.key,
    required this.virtualAccount,
  });

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (color) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BaseText(
              'Fund your wallet',
              fontWeight: FontWeight.bold,
              fontSize: TextSizes.size16,
            ),
            const SizedBox(height: Spacings.spacing4),
            BaseText(
              'Fund your account by transferring directly to this account number.',
              color: color.always767676,
              fontSize: TextSizes.size12,
            ),
            const SizedBox(height: Spacings.spacing14),
            Center(
              child: BaseText(
                '$virtualAccount\nCashir Bank',
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
                fontSize: TextSizes.size18,
                color: color.always767676,
              ),
            ),
            const SizedBox(height: Spacings.spacing20),
            CustomButton(
              expanded: true,
              text: 'Copy',
              onPressed: () {},
            )
          ],
        );
      },
    );
  }
}
