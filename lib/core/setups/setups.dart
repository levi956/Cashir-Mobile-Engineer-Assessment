import 'package:cashir_assessment/core/core.dart';

class Setups {
  static Future<void> run() async {
    EnvironmentSetup.run(environment: Environment.live);
  }
}
