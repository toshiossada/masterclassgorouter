import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

extension Navigation on BuildContext {
  Future pushNamed(String route) {
    return Modular.to.pushNamed(route);
  }

  Future pushReplacementNamed(String route) {
    return Modular.to.pushReplacementNamed(route);
  }

  void navigate(String route) {
    Modular.to.navigate(route);
  }

  void pop() {
    Modular.to.pop();
  }
}