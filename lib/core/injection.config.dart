// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:task_1/core/adsa.dart' as _i6;
import 'package:task_1/core/auth_provider.dart' as _i4;
import 'package:task_1/core/service/service.dart' as _i3;
import 'package:task_1/data/get_clinic_repo.dart' as _i8;
import 'package:task_1/data/source/json_data.dart' as _i7;
import 'package:task_1/domain/auth_usecase.dart' as _i5;
import 'package:task_1/domain/get_clinic_usecase.dart' as _i9;
import 'package:task_1/presentation/authentication/bloc/auth_bloc.dart' as _i11;
import 'package:task_1/presentation/bloc/clinics_bloc.dart' as _i10;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await gh.lazySingletonAsync<_i3.AsyncService>(
      () => _i3.AsyncService.createWith(),
      preResolve: true,
      dispose: (i) => i.dispose(),
    );
    gh.singleton<_i4.AuthProvider>(
      _i4.AuthProvider(),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i5.AuthUseCase>(
        () => _i5.AuthUseCaseImpl(gh<_i4.AuthProvider>()));
    gh.factoryParam<_i6.BackendService, String, dynamic>((
      url,
      _,
    ) =>
        _i6.BackendService(url));
    gh.singleton<_i7.JsonDataSrc>(
      _i7.JsonDataSrc(),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i3.Service>(() => _i3.Service(gh<String>()));
    gh.factory<_i8.GetClinicRepo>(
      () => _i8.GetClinicRepoImpl(
        gh<_i3.AsyncService>(),
        gh<_i7.JsonDataSrc>(),
      ),
      instanceName: 'local',
    );
    gh.factory<_i8.GetClinicRepo>(
      () => _i8.NetworkClinicRepoImpl(gh<_i7.JsonDataSrc>()),
      instanceName: 'remote',
    );
    gh.factory<_i9.GetClinicUseCase>(() =>
        _i9.GetClinicUseCaseImpl(gh<_i8.GetClinicRepo>(instanceName: 'local')));
    return this;
  }

  /// initializes the registration of HomeScope-scope dependencies inside of [GetIt]
  _i1.GetIt initHomeScopeScope({_i1.ScopeDisposeFunc? dispose}) {
    return _i2.GetItHelper(this).initScope(
      'HomeScope',
      dispose: dispose,
      init: (_i2.GetItHelper gh) {
        gh.factory<_i10.ClinicsBloc>(
            () => _i10.ClinicsBloc(gh<_i9.GetClinicUseCase>()));
      },
    );
  }

  /// initializes the registration of Auth-scope dependencies inside of [GetIt]
  _i1.GetIt initAuthScope({_i1.ScopeDisposeFunc? dispose}) {
    return _i2.GetItHelper(this).initScope(
      'Auth',
      dispose: dispose,
      init: (_i2.GetItHelper gh) {
        gh.factory<_i11.AuthBloc>(() => _i11.AuthBloc(gh<_i5.AuthUseCase>()));
      },
    );
  }
}
