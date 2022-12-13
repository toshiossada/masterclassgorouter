import '../entities/currency_information_entity.dart';

abstract class ICurrencyRepository {
  Future<CurrencyInfoEntity> getCurrencies();
}
