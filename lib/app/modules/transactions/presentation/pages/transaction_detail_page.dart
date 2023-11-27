import 'package:cashir_assessment/app/modules/authentication/data/models/user_model.dart';
import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:cashir_assessment/core/core.dart';
import 'package:flutter/material.dart';

import '../components/transaction_information_tile_component.dart';

class TransactionDetailPage extends StatefulWidget {
  final Transaction transaction;
  const TransactionDetailPage(
    this.transaction, {
    super.key,
  });

  @override
  State<TransactionDetailPage> createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<TransactionDetailPage>
    with AppThemeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.alwaysWhite,
      appBar: const AppBarComponent(
        title: 'Transaction Detail',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacings.spacing18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Spacings.spacing16),
              CircleAvatar(
                backgroundColor: colors.always161455,
                radius: Spacings.spacing24,
                child: BaseText(
                  widget.transaction.desc[0],
                  color: colors.alwaysWhite,
                  fontSize: TextSizes.size16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: Spacings.spacing24),
              BaseText(
                widget.transaction.desc,
                fontWeight: FontWeight.w700,
                fontSize: TextSizes.size20,
              ),
              const SizedBox(height: Spacings.spacing16),
              BaseText(
                '${widget.transaction.type == 'debit' ? 'Debit' : 'Credit'} transaction on ${widget.transaction.parsedDate}',
                fontSize: TextSizes.size14,
                color: colors.always767676,
              ),
              const SizedBox(height: Spacings.spacing20),
              Divider(
                color: colors.always767676,
              ),
              const SizedBox(height: Spacings.spacing20),
              TransactionDetailListTileComponent(
                leading: 'Amount',
                subtitle: 'NGN ${widget.transaction.amount}',
              ),
              const SizedBox(height: Spacings.spacing24),
              TransactionDetailListTileComponent(
                leading: 'Transaction Id',
                subtitle: widget.transaction.id.toString(),
              ),
              const SizedBox(height: Spacings.spacing20),
              const TransactionDetailListTileComponent(
                leading: 'Status',
                subtitle: 'Completed',
              ),
              const Spacer(),
              CustomButton(
                expanded: true,
                text: 'Back',
                onPressed: () => pop(context),
              ),
              const SizedBox(height: Spacings.spacing20),
            ],
          ),
        ),
      ),
    );
  }
}
