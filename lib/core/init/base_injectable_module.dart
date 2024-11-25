import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class BaseInjectableModule {
  @lazySingleton
  SharedPreferences get prefs => throw UnimplementedError();

  @lazySingleton
  Dio get dio => Dio();
}
