class EnvironmentSetup {
  static void run({required Environment environment}) {
    env = environment;
  }

  static String get baseUrl => env == Environment.live ? _liveUrl : _testUrl;

  static late Environment env;
  static final String _liveUrl =
      'https://1c8c53e2-0aec-46fe-987f-9dae3b564b23.mock.pstmn.io/'.trim();
  static final String _testUrl =
      'https://1c8c53e2-0aec-46fe-987f-9dae3b564b23.mock.pstmn.io/'.trim();
}

enum Environment { live, test }
