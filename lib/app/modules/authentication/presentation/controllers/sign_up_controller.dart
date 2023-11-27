import 'package:cashir_assessment/core/core.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/sign_up_model.dart';
import '../../domain/repository/interface/authentication_repository_interface.dart';

@lazySingleton
class SignUpController extends BaseController<SignUpModel, void> {
  SignUpController({
    required AuthenticationRepositoryInterface repository,
  }) : super(function: repository.simulateSignUp);

  void signUp({
    required String email,
    required String password,
    required String name,
  }) {
    SignUpModel model = SignUpModel(
      email: email,
      password: password,
      name: name,
    );
    trigger(model);
  }
}
