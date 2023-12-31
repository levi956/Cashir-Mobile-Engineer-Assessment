import 'package:cashir_assessment/app/modules/onboard/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Brightness get brightness {
    return WidgetsBinding.instance.platformDispatcher.platformBrightness;
  }

  @override
  Widget build(BuildContext context) {
    return const OnboardingPage();
  }
}
