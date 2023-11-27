import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:cashir_assessment/core/framework/theme/presentation/app_theme_mixin.dart';
import 'package:flutter/material.dart';

class KycVerificationPage extends StatefulWidget {
  const KycVerificationPage({super.key});

  @override
  State<KycVerificationPage> createState() => _KycVerificationPageState();
}

class _KycVerificationPageState extends State<KycVerificationPage>
    with AppThemeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.alwaysWhite,
      appBar: const AppBarComponent(
        hasLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacings.spacing20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Spacings.spacing20),
              const BaseText(
                'KYC Verification',
                fontWeight: FontWeight.bold,
                fontSize: TextSizes.size20,
              ),
              const SizedBox(height: Spacings.spacing6),
              BaseText(
                'Please fill in your KYC information.',
                color: colors.always767676,
                fontSize: TextSizes.size14,
              ),
              const SizedBox(height: Spacings.spacing30),
              Expanded(
                child: ListView(
                  children: const [
                    TextFieldComponent(
                      headerLess: false,
                      hint: 'Address',
                    ),
                    SizedBox(height: Spacings.spacing10),
                    TextFieldComponent(
                      headerLess: false,
                      hint: 'National Identificatin Number (NIN)',
                    ),
                    SizedBox(height: Spacings.spacing10),
                    TextFieldComponent(
                      headerLess: false,
                      hint: 'Last Meter Bill ID',
                    ),
                  ],
                ),
              ),
              CustomButton(
                expanded: true,
                text: 'Proceed',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
