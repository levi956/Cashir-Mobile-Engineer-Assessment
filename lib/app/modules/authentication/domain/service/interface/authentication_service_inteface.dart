import '../../../data/models/user_model.dart';

abstract interface class AuthenticationServiceInterface {
  Future<void> simulateSignUp();
  Future<void> simulateKycResigeration();
  Future<User> getUser();
}
