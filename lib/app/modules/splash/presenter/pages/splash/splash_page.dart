import 'package:aula1/app/modules/splash/presenter/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../../commons/adapters/navigation_adapter.dart';

class SplashPage extends StatefulWidget {
  final SplashController controller;
  const SplashPage({
    super.key,
    required this.controller,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.init().then((value) {
      context.navigate('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
