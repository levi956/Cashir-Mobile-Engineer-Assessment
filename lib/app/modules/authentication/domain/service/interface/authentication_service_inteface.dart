import '../../../data/models/sign_up_model.dart';
import '../../../data/models/submit_kyc_model.dart';
import '../../../data/models/user_model.dart';

abstract interface class AuthenticationServiceInterface {
  Future<void> simulateSignUp(SignUpModel model);
  Future<void> simulateKycResigeration(SubmitKycModel model);
  Future<User> getUser();
}
