import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/converter/converter_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
            (i) => Dio(BaseOptions(baseUrl: 'https://api.hgbrasil.com/'))),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/home', module: ConverterModule()),
      ];
}
