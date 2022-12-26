import 'package:aula1/app/modules/splash/presenter/pages/splash/splash_controller.dart';
import 'package:aula1/app/modules/splash/presenter/pages/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => SplashController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => SplashPage(
            controller: Modular.get<SplashController>(),
          ),
        )
      ];
}
