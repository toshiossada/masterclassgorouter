import 'package:aula1/app/modules/converter/domain/entities/currency_information_entity.dart';
import 'package:aula1/app/modules/converter/domain/enums/currency_type_enum.dart';
import 'package:aula1/app/modules/converter/domain/repositories/currency_repository_interface.dart';
import 'package:aula1/app/modules/converter/domain/usecases/convert_currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'convert_currency_test.mocks.dart';

//class MockICurrencyRepository extends Mock implements ICurrencyRepository {}
@GenerateMocks([ICurrencyRepository])
void main() {
  late ConvertCurrency usecase;
  final repository = MockICurrencyRepository();

  setUpAll(() {
    usecase = ConvertCurrency(currencyRepository: repository);
  });

  test(
      'Dado o valor 12 E'
      'o tipo de moeda BRL '
      'QUANDO a cotaçao do dolar for 4 reais '
      'E o euro for 5 reais '
      'ENTÃO deve retornar o valor de 12 REAIS '
      'E 3 DOLARES '
      'E o 2.4 EUROS', () async {
    //arranje
    const value = '12';
    const currencyType = CurrencyTypeEnum.brl;
    when(repository.getCurrencies()).thenAnswer(
        (_) async => const CurrencyInfoEntity(dollarValue: 4, euroValue: 5));

    //act
    final result = await usecase(value: value, type: currencyType);

    //assert
    expect(result.real, 12);
    expect(result.dollar, 3);
    expect(result.euro, 2.4);
    verify(repository.getCurrencies()).called(1);
  });

  test(
      'Dado o valor de 16 reais '
      'Quando a cotação do dolar for de 4 reais e o euro de 8 reais '
      'Deve retornar 16 reais, 2 euros e 4 dolars ', () async {
    const value = '16';
    const currencyType = CurrencyTypeEnum.brl;
    when(repository.getCurrencies()).thenAnswer(
        (_) async => const CurrencyInfoEntity(dollarValue: 4, euroValue: 8));

    final result = await usecase(value: value, type: currencyType);

    expect(result.real, 16);
    expect(result.euro, 2);
    expect(result.dollar, 4);
    verify(repository.getCurrencies()).called(1);
  });

  test(
      'Dado um valor vazio '
      'Quando o usecase de conversão '
      'Deve retornar uma excessão com a mensagem Valor não pode ser vazio',
      () async {
    const value = '';
    const currencyType = CurrencyTypeEnum.brl;

    final result = usecase(value: value, type: currencyType);

    expect(result, throwsException);
    verifyNever(repository.getCurrencies());
  });
}
