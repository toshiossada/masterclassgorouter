import 'package:aula1/app/modules/converter/presenter/pages/home/home_controller.dart';
import 'package:aula1/app/modules/converter/presenter/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

import 'app_module.dart';
import 'modules/splash/presenter/pages/splash/splash_controller.dart';
import 'modules/splash/presenter/pages/splash/splash_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          SplashPage(controller: getIt<SplashController>()),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) =>
          HomePage(controller: getIt<HomeController>()),
    ),
  ],
);
