import 'package:cashir_assessment/app/modules/authentication/data/models/sign_up_model.dart';
import 'package:cashir_assessment/app/modules/authentication/data/models/submit_kyc_model.dart';

import '../../../data/models/user_model.dart';

abstract interface class AuthenticationRepositoryInterface {
  Future<void> simulateSignUp(SignUpModel model);
  Future<void> simulateKycResigeration(SubmitKycModel model);
  Future<User> getUser();
}
