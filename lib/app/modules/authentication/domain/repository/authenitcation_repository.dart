import 'package:cashir_assessment/app/modules/authentication/data/models/sign_up_model.dart';
import 'package:cashir_assessment/app/modules/authentication/data/models/submit_kyc_model.dart';
import 'package:cashir_assessment/app/modules/authentication/data/models/user_model.dart';
import 'package:cashir_assessment/app/modules/authentication/domain/repository/interface/authentication_repository_interface.dart';
import 'package:cashir_assessment/app/modules/authentication/domain/service/interface/authentication_service_inteface.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthenticationRepositoryInterface)
class AuthenticationRepository implements AuthenticationRepositoryInterface {
  final AuthenticationServiceInterface _authenticationService;

  AuthenticationRepository(this._authenticationService);
  @override
  Future<void> simulateKycResigeration(SubmitKycModel model) {
    return _authenticationService.simulateKycResigeration(model);
  }

  @override
  Future<void> simulateSignUp(SignUpModel model) {
    return _authenticationService.simulateSignUp(model);
  }

  @override
  Future<User> getUser() {
    return _authenticationService.getUser();
  }
}
