import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:cashir_assessment/core/framework/theme/presentation/app_theme_builder.dart';
import 'package:flutter/material.dart';

class TransactionDetailListTileComponent extends StatelessWidget {
  const TransactionDetailListTileComponent({
    super.key,
    required this.leading,
    required this.subtitle,
  });

  final String leading;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (color) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(
                  leading,
                  fontSize: TextSizes.size14,
                  color: color.always767676,
                ),
                const SizedBox(height: Spacings.spacing10),
                Text(
                  subtitle,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: TextSizes.size16,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
