import 'package:cashir_assessment/core/core.dart';
import 'package:flutter/material.dart';

class Setups {
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    EnvironmentSetup.run(environment: Environment.live);
  }
}
