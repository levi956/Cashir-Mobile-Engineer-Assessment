import '../../../data/models/user_model.dart';

abstract interface class AuthenticationRepositoryInterface {
  Future<void> simulateSignUp();
  Future<void> simulateKycResigeration();
  Future<User> getUser();
}
