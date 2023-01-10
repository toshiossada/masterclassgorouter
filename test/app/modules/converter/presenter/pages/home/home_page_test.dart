import 'package:aula1/app/app_module.dart';
import 'package:aula1/app/modules/converter/converter_module.dart';
import 'package:aula1/app/modules/converter/presenter/pages/home/home_controller.dart';
import 'package:aula1/app/modules/converter/presenter/pages/home/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

import '../../../../../../utils/mock.dart';
import '../../../../../../utils/testable_widget.dart';
import 'home_page_test.mocks.dart';

@GenerateMocks([Dio, IModularNavigator])
void main() {
  final httpMock = MockDio();
  final navigatorMock = MockIModularNavigator();
  setUp(() async {
    initModules([
      AppModule(),
      ConverterModule()
    ], replaceBinds: [
      Bind.instance<Dio>(httpMock),
    ]);

    Modular.navigatorDelegate = navigatorMock;
  });

  testWidgets(
      'Dado o valor de 10 reais no campo txtReal '
      'Quando a cotação do dolar estiver 5 e a do euro 6 '
      'Deve Escrever no campo txtDolar o valor de 2.00 e n '
      '  o campo txtEuro o valor de 1.67 ', (tester) async {
    when(httpMock.get(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer((_) async => Response(
            statusCode: 200,
            data: responsePayloadTest1,
            requestOptions: RequestOptions(path: '')));

    var controller = Modular.get<HomeController>();
    await tester.pumpWidget(testableWidget(HomePage(controller: controller)));

    var txtBrl = find.byKey(const Key('txtBrl'));
    var txtUsd = find.byKey(const Key('txtUsd'));
    var txtEur = find.byKey(const Key('txtEur'));

    expect(txtBrl, findsOneWidget);
    expect(txtUsd, findsOneWidget);
    expect(txtEur, findsOneWidget);

    await tester.enterText(txtBrl, '10');
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    // assert
    expect(find.text("10"), findsOneWidget);
    expect(find.text("1.67"), findsOneWidget);
    expect(find.text("2.00"), findsOneWidget);
  });
}
