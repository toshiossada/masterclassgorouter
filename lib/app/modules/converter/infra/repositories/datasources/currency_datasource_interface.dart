import '../models/currency_information_model.dart';

abstract class ICurrencyDataSource {
  Future<CurrencyInfoModel> getCurrencies();
}
