import 'package:cashir_assessment/app/modules/authentication/presentation/controllers/get_user_controller.dart';
import 'package:cashir_assessment/app/modules/transactions/presentation/components/transaction_tile_component.dart';
import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:cashir_assessment/core/framework/theme/presentation/app_theme_mixin.dart';
import 'package:cashir_assessment/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/account_action_button_component.dart';
import '../components/fund_account_sheet_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AppThemeMixin {
  late GetUserController getUserController;

  String name = '';
  String virtualAccount = '';
  String balance = '';

  @override
  void initState() {
    getUserController = getIt<GetUserController>();
    getUserController.get();

    getUserController.listenWhen(
      success: (user) {
        name = "${user.firstName} ${user.lastName}";
        virtualAccount = user.virtualAcctNo;
        balance = user.accountBalance;
        setState(() {});
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    getUserController.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.alwaysWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacings.spacing20,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Spacings.spacing30),
              Row(
                children: [
                  CircleAvatar(
                    radius: Spacings.spacing14,
                    backgroundColor: colors.alwaysF1F1F1,
                    child: Center(
                      child: SvgPicture.asset(
                        Svgs.profile,
                        colorFilter: ColorFilter.mode(
                          colors.always292D32,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: Spacings.spacing10,
                  ),
                  BaseText(
                    'Hi, $name',
                    fontSize: TextSizes.size16,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(height: Spacings.spacing20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    '₦ $balance',
                    fontSize: TextSizes.size30,
                    fontWeight: FontWeight.w500,
                  ),
                  Icon(
                    Icons.visibility,
                    color: colors.always161455,
                  )
                ],
              ),
              const SizedBox(height: Spacings.spacing20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    AccountActionButton(
                      textColor: colors.alwaysWhite,
                      color: colors.always161455,
                      text: 'Fund',
                      onTap: () {
                        BottomSheetFunction.showCustomBottomSheet(
                          context: context,
                          topPadding: false,
                          child: FundAccountSheetComponent(
                            virtualAccount: virtualAccount,
                          ),
                          color: colors,
                        );
                      },
                      image: Svgs.fund,
                      svgColor: colors.alwaysWhite,
                    ),
                    const SizedBox(width: Spacings.spacing10),
                    AccountActionButton(
                      textColor: colors.alwaysWhite,
                      onTap: () {},
                      color: colors.alwaysBE1414,
                      text: 'Logout',
                      image: Svgs.transfer,
                      svgColor: colors.alwaysWhite,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Spacings.spacing30),
              const BaseText(
                'Transactions',
                fontSize: TextSizes.size16,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: Spacings.spacing20),
              getUserController.buildWhen(
                success: (user) {
                  final transactions = user.transactions;
                  if (transactions.isEmpty) {}
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (_, index) {
                        final transacton = transactions[index];
                        return TransactionTileComponent(transacton);
                      },
                      separatorBuilder: (_, __) => const SizedBox(
                        height: Spacings.spacing10,
                      ),
                      itemCount: transactions.length,
                    ),
                  );
                },
                failure: (e) => BaseText(e.toString()),
                loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
