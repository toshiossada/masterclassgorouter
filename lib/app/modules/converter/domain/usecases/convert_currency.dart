import '../entities/currency_entity.dart';
import '../enums/currency_type_enum.dart';
import '../repositories/currency_repository_interface.dart';

class ConvertCurrency {
  final ICurrencyRepository currencyRepository;

  ConvertCurrency({required this.currencyRepository});

  Future<CurrencyEntity> call(
      {required String value, required CurrencyTypeEnum type}) async {
    if (value.isEmpty) {
      throw Exception('Valor não pode ser vazio');
    } else if (double.tryParse(value) == null) {
      throw Exception('Digite um numero valido');
    }

    var dValue = double.parse(value);
    var currencies = await currencyRepository.getCurrencies();

    switch (type) {
      case CurrencyTypeEnum.brl:
        return CurrencyEntity(
          dollar: dValue / currencies.dollarValue,
          euro: dValue / currencies.euroValue,
          real: dValue,
        );
      case CurrencyTypeEnum.usd:
        final real = dValue * currencies.dollarValue;
        return CurrencyEntity(
          dollar: dValue,
          euro: real / currencies.euroValue,
          real: real,
        );
      case CurrencyTypeEnum.eur:
        final real = dValue * currencies.euroValue;
        return CurrencyEntity(
          dollar: real / currencies.dollarValue,
          euro: dValue,
          real: real,
        );
    }
  }
}
