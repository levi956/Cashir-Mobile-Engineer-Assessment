import 'package:cashir_assessment/app/modules/authentication/presentation/controllers/sign_up_controller.dart';
import 'package:cashir_assessment/app/modules/authentication/presentation/pages/kyc_verification_page.dart';
import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:cashir_assessment/core/core.dart';
import 'package:cashir_assessment/injectable.dart';

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with AppThemeMixin {
  bool obscureText = false;
  late SignUpController signUpController;

  @override
  void initState() {
    signUpController = getIt<SignUpController>();

    signUpController.listenWhen(
      success: (data) {
        pop(context);
        pushTo(context, const KycVerificationPage());
      },
      failure: (e) {},
      loading: () => showLoader(context),
    );

    super.initState();
  }

  @override
  void dispose() {
    signUpController.reset();
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
            children: [
              const SizedBox(height: Spacings.spacing30),
              Expanded(
                child: ListView(
                  children: [
                    const BaseText(
                      'Create Account',
                      fontSize: TextSizes.size18,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: Spacings.spacing8),
                    BaseText(
                      'Create a free and amazing acccount with Cashir.',
                      color: colors.always767676,
                      fontSize: TextSizes.size14,
                    ),
                    const SizedBox(height: Spacings.spacing2),
                    const SizedBox(height: Spacings.spacing24),
                    Form(
                      key: const Key(''),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Expanded(
                                child: TextFieldComponent(
                                  hint: 'First Name',
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              SizedBox(
                                width: Spacings.spacing8,
                              ),
                              Expanded(
                                child: TextFieldComponent(
                                  hint: 'Last Name',
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: Spacings.spacing24),
                          const TextFieldComponent(
                            hint: 'Username',
                            textInputAction: TextInputAction.next,
                            prefixText: '@',
                          ),
                          const SizedBox(height: Spacings.spacing24),
                          const TextFieldComponent(
                            hint: 'Email',
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: Spacings.spacing24),
                          const TextFieldComponent(
                            hint: 'Phone',
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            prefixText: '+234',
                          ),
                          const SizedBox(height: Spacings.spacing24),
                          TextFieldComponent(
                            obscureText: obscureText,
                            suffix: obscureText
                                ? IconButton(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onPressed: () {
                                      obscureText = !obscureText;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      size: 20,
                                      color: colors.always161455,
                                    ),
                                  )
                                : IconButton(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onPressed: () {
                                      obscureText = !obscureText;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.visibility_off,
                                      size: 20,
                                      color: colors.always161455,
                                    ),
                                  ),
                            hint: 'Password',
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: Spacings.spacing24),
                          const SizedBox(
                            height: Spacings.spacing20,
                          ),
                        ],
                      ),
                    ),
                    BaseText(
                      'Must be at least 8 characters including upper, lower case letters and or a symbol ( e.g ythhYT8!)',
                      color: colors.always767676,
                      fontSize: TextSizes.size12,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(height: Spacings.spacing28),
                  ],
                ),
              ),
              const SizedBox(height: Spacings.spacing8),
              CustomButton(
                expanded: true,
                text: 'Proceed',
                onPressed: () => signUpController.signUp(
                  email: '',
                  password: '',
                  name: '',
                ),
              ),
              const SizedBox(height: Spacings.spacing16),
            ],
          ),
        ),
      ),
    );
  }
}
