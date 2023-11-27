import 'package:cashir_assessment/app.dart';
import 'package:cashir_assessment/core/core.dart';
import 'package:cashir_assessment/injectable.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Setups.run();
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cashir',
      debugShowCheckedModeBanner: false,
      builder: (_, child) {
        return _Unfocus(
          child: child!,
        );
      },
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
        fontFamily: "DMSans",
      ),
      home: const App(),
    );
  }
}

// removes focus all through app
class _Unfocus extends StatelessWidget {
  const _Unfocus({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
