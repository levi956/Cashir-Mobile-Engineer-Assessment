import 'package:cashir_assessment/app/modules/authentication/data/models/user_model.dart';
import 'package:cashir_assessment/app/modules/authentication/domain/repository/interface/authentication_repository_interface.dart';
import 'package:cashir_assessment/app/modules/authentication/domain/service/interface/authentication_service_inteface.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthenticationRepositoryInterface)
class AuthenticationRepository implements AuthenticationRepositoryInterface {
  final AuthenticationServiceInterface _authenticationService;

  AuthenticationRepository(this._authenticationService);
  @override
  Future<void> simulateKycResigeration() {
    return _authenticationService.simulateKycResigeration();
  }

  @override
  Future<void> simulateSignUp() {
    return _authenticationService.simulateSignUp();
  }

  @override
  Future<User> getUser() {
    return _authenticationService.getUser();
  }
}
