import 'package:aula1/app/modules/converter/domain/entities/currency_information_entity.dart';
import 'package:aula1/app/modules/converter/domain/enums/currency_type_enum.dart';
import 'package:aula1/app/modules/converter/domain/repositories/currency_repository_interface.dart';
import 'package:aula1/app/modules/converter/domain/usecases/convert_currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockICurrencyRepository extends Mock implements ICurrencyRepository {}

void main() {
  late ConvertCurrency usecase;
  final repository = MockICurrencyRepository();

  setUp(() {
    usecase = ConvertCurrency(currencyRepository: repository);
  });
  test('convert currency ...', () async {
    when(() => repository.getCurrencies()).thenAnswer(
        (_) async => const CurrencyInfoEntity(dollarValue: 4, euroValue: 5));
    var result = await usecase(value: '12', type: CurrencyTypeEnum.brl);
    expect(result.real, 12);
    expect(result.dollar, 3);
    expect(result.euro, 2.4);
  });
}
