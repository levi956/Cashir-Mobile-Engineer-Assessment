import 'package:cashir_assessment/app/modules/authentication/data/models/user_model.dart';
import 'package:cashir_assessment/app/modules/authentication/domain/repository/interface/authentication_repository_interface.dart';
import 'package:cashir_assessment/core/core.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserController extends NoArgBaseController<User> {
  GetUserController({required AuthenticationRepositoryInterface repository})
      : super(function: repository.getUser);
}
