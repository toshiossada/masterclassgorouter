import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeStore extends ValueNotifier<bool> with Disposable {
  HomeStore() : super(false);
  bool get isLoading => value;
  set setLoading(bool value) => this.value = value;

  @override
  void dispose() {
    super.dispose();
  }
}
