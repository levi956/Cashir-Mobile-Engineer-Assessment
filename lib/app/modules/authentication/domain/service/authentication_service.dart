import 'dart:convert';

import 'package:cashir_assessment/app/modules/authentication/data/models/user_model.dart';
import 'package:cashir_assessment/app/modules/authentication/domain/service/interface/authentication_service_inteface.dart';
import 'package:cashir_assessment/app/shared/shared.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthenticationServiceInterface)
class AuthenticationService implements AuthenticationServiceInterface {
  @override
  Future<void> simulateKycResigeration() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> simulateSignUp() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<User> getUser() async {
    final r = await HTTP.get('test/dev');
    if (r.is200or201) {
      final body = jsonDecode(r.body);
      final user = body['data'];
      return User.fromJson(user);
    }
    throw AppException.fromResponse(r);
  }
}
