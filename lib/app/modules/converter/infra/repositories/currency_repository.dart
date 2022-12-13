import 'package:aula1/app/modules/converter/domain/entities/currency_information_entity.dart';

import '../../domain/repositories/currency_repository_interface.dart';
import 'datasources/currency_datasource_interface.dart';

class CurrencyRepository implements ICurrencyRepository {
  final ICurrencyDataSource currencyDatasouce;

  CurrencyRepository({required this.currencyDatasouce});
  @override
  Future<CurrencyInfoEntity> getCurrencies() async {
    final result = await currencyDatasouce.getCurrencies();

    return CurrencyInfoEntity(
      dollarValue: result.dollarValue,
      euroValue: result.euroValue,
    );
  }
}
