import 'package:flutter/cupertino.dart';

class HomeStore extends ValueNotifier<bool> {
  HomeStore() : super(false);
  bool get isLoading => value;
  set setLoading(bool value) => this.value = value;
}
