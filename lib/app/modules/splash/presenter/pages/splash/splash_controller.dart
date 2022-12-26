class SplashController {
  int i = 0;
  Future init() async {
    //Carregmentos pesados...
    await Future.delayed(const Duration(seconds: 3));
  }
}
