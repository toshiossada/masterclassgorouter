import 'package:aula1/app/modules/converter/infra/repositories/models/currency_information_model.dart';
import 'package:dio/dio.dart';

import '../repositories/datasources/currency_datasource_interface.dart';

class CurrencyDataSource implements ICurrencyDataSource {
  final Dio client;

  CurrencyDataSource({required this.client});

  @override
  Future<CurrencyInfoModel> getCurrencies() async {
    try {
      var response =
          await client.get('/finance', queryParameters: {'format': 'json'});

      var result = CurrencyInfoModel.fromMap(response.data);
      return result;
    } catch (e) {
      throw Exception(
        'Erro ao tentar buscar dados externos',
      );
    }
  }
}
