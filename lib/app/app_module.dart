import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'modules/converter/converter_module.dart' as converter;
import 'modules/splash/splash_module.dart' as splash;

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory(
      () => Dio(BaseOptions(baseUrl: 'https://api.hgbrasil.com/')));
  splash.setup();
  converter.setup();
}
