// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'base_injectable_module.dart' as _i6;
import 'cache_manager.dart' as _i670;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final baseInjectableModule = _$BaseInjectableModule();
  gh.lazySingleton<_i460.SharedPreferences>(() => baseInjectableModule.prefs);
  gh.lazySingleton<_i361.Dio>(() => baseInjectableModule.dio);
  gh.lazySingleton<_i670.CacheManager>(
      () => _i670.CacheManager(gh<_i460.SharedPreferences>()));
  return getIt;
}

class _$BaseInjectableModule extends _i6.BaseInjectableModule {}
