// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app/modules/authentication/domain/repository/authenitcation_repository.dart'
    as _i7;
import 'app/modules/authentication/domain/repository/interface/authentication_repository_interface.dart'
    as _i6;
import 'app/modules/authentication/domain/service/authentication_service.dart'
    as _i5;
import 'app/modules/authentication/domain/service/interface/authentication_service_inteface.dart'
    as _i4;
import 'app/modules/authentication/presentation/controller/get_user_controller.dart'
    as _i8;
import 'core/framework/theme/color/app_theme_controller.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppThemeController>(() => _i3.AppThemeController());
    gh.lazySingleton<_i4.AuthenticationServiceInterface>(
        () => _i5.AuthenticationService());
    gh.lazySingleton<_i6.AuthenticationRepositoryInterface>(() =>
        _i7.AuthenticationRepository(gh<_i4.AuthenticationServiceInterface>()));
    gh.lazySingleton<_i8.GetUserController>(() => _i8.GetUserController(
        repository: gh<_i6.AuthenticationRepositoryInterface>()));
    return this;
  }
}
