import 'package:cashir_assessment/app/modules/authentication/data/models/user_model.dart';
import 'package:cashir_assessment/app/modules/transactions/presentation/components/atom/transaction_type_indicator_atom.dart';
import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:cashir_assessment/core/framework/theme/presentation/app_theme_builder.dart';
import 'package:flutter/material.dart';

class TransactionTileComponent extends StatelessWidget {
  final Transaction transaction;
  const TransactionTileComponent(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (color) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: Spacings.spacing14,
            horizontal: Spacings.spacing10,
          ),
          decoration: BoxDecoration(
            color: color.alwaysF5F9FF,
            borderRadius: BorderRadius.circular(
              Spacings.spacing12,
            ),
          ),
          child: Row(
            children: [
              TransactionTypeIndicatorAtom(
                transactionType: transaction.type,
              ),
              const SizedBox(width: Spacings.spacing12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      transaction.desc,
                      color: color.always181D27,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: Spacings.spacing4),
                    BaseText(
                      transaction.parsedDate,
                      color: color.always767676,
                    ),
                  ],
                ),
              ),
              BaseText(
                '₦${transaction.amount}',
                color: color.always181D27,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        );
      },
    );
  }
}
