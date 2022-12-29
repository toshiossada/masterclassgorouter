import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../../../domain/enums/currency_type_enum.dart';
import '../../../domain/usecases/convert_currency.dart';
import 'home_store.dart';

class HomeController with Disposable {
  final ConvertCurrency convertCurrency;
  final HomeStore store;

  HomeController({required this.convertCurrency, required this.store});

  final txtReais = TextEditingController();
  final txtDolars = TextEditingController();
  final txtEuros = TextEditingController();
  Timer? _debounce;
  _search(String value, CurrencyTypeEnum type) {
    if (_debounce != null && _debounce!.isActive) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      store.setLoading = true;
      NumberFormat formatter = NumberFormat.currency(symbol: '');
      try {
        if (value.isNotEmpty) {
          await Future.delayed(const Duration(seconds: 2));
          var currencies = await convertCurrency(value: value, type: type);

          if ((type != CurrencyTypeEnum.usd)) {
            txtDolars.text = formatter.format(currencies.dollar);
          }
          if ((type != CurrencyTypeEnum.brl)) {
            txtReais.text = formatter.format(currencies.real);
          }
          if ((type != CurrencyTypeEnum.eur)) {
            txtEuros.text = formatter.format(currencies.euro);
          }
        } else {
          txtDolars.text = '';
          txtReais.text = '';
          txtEuros.text = '';
        }
      } catch (e, s) {
        log('Erro ao converter valor: $value', error: e, stackTrace: s);
      } finally {
        store.setLoading = false;
      }
    });
  }

  Future onRealChanged(String v) async {
    _search(v, CurrencyTypeEnum.brl);
  }

  Future onDolarChanged(String v) async {
    _search(v, CurrencyTypeEnum.usd);
  }

  Future onEuroChanged(String v) async {
    _search(v, CurrencyTypeEnum.eur);
  }

  @override
  void dispose() {
    txtReais.dispose();
    txtDolars.dispose();
    txtEuros.dispose();
  }
}
