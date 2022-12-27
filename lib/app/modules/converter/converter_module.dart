import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/currency_repository_interface.dart';
import 'domain/usecases/convert_currency.dart';
import 'infra/datasources/currency_datasource.dart';
import 'infra/repositories/currency_repository.dart';
import 'infra/repositories/datasources/currency_datasource_interface.dart';
import 'presenter/pages/author/author_page.dart.dart';
import 'presenter/pages/home/home_controller.dart';
import 'presenter/pages/home/home_page.dart';
import 'presenter/pages/home/home_store.dart';

class ConverterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeStore()),
        Bind.factory<ICurrencyDataSource>(
            (i) => CurrencyDataSource(client: i())),
        Bind.factory<ICurrencyRepository>(
            (i) => CurrencyRepository(currencyDatasouce: i())),
        Bind.factory<ConvertCurrency>(
            (i) => ConvertCurrency(currencyRepository: i())),
        Bind.factory(
          (i) => HomeController(convertCurrency: i(), store: i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) =>
                HomePage(controller: Modular.get<HomeController>())),
        ChildRoute('/created', child: (context, args) => const AuthorPage()),
      ];
}