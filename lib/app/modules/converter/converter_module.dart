import 'package:aula1/app/modules/converter/domain/usecases/convert_currency.dart';
import 'package:aula1/app/modules/converter/infra/datasources/currency_datasource.dart';
import 'package:aula1/app/modules/converter/infra/repositories/currency_repository.dart';
import 'package:aula1/app/modules/converter/presenter/pages/home/home_controller.dart';
import 'package:aula1/app/modules/converter/presenter/pages/home/home_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'domain/repositories/currency_repository_interface.dart';
import 'infra/repositories/datasources/currency_datasource_interface.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory(() => HomeStore());
  getIt.registerFactory<ICurrencyDataSource>(
      () => CurrencyDataSource(client: getIt.get<Dio>()));
  getIt.registerFactory<ICurrencyRepository>(() =>
      CurrencyRepository(currencyDatasouce: getIt.get<ICurrencyDataSource>()));
  getIt.registerFactory<ConvertCurrency>(() =>
      ConvertCurrency(currencyRepository: getIt.get<ICurrencyRepository>()));
  getIt.registerFactory(
    () => HomeController(
        convertCurrency: getIt.get<ConvertCurrency>(),
        store: getIt.get<HomeStore>()),
  );
}
