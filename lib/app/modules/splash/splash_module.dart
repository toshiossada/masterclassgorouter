import 'package:get_it/get_it.dart';

import 'presenter/pages/splash/splash_controller.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory(() => SplashController());
}
