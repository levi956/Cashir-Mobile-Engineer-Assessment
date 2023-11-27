import 'package:cashir_assessment/app/modules/authentication/presentation/pages/sign_up_page.dart';
import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:cashir_assessment/core/core.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (colors) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacings.spacing20,
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: FractionallySizedBox(
                        widthFactor: 0.6,
                        child: Image.asset(Pngs.onboardImage),
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacings.spacing24),
                  Text(
                    'Perform all form of transactions with ease.',
                    style: TextStyle(
                      color: colors.always161455,
                      fontSize: Spacings.spacing30,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: Spacings.spacing10),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'From Cards to seamless transfer of funds, transaction have never been easy. ',
                      style: TextStyle(
                        color: colors.always767676,
                        fontSize: Spacings.spacing14,
                      ),
                    ),
                  ),
                  CustomButton(
                    expanded: true,
                    text: 'Get Started',
                    onPressed: () => pushTo(context, const SignUpPage()),
                  ),
                  const SizedBox(height: Spacings.spacing14),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
