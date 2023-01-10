// ignore_for_file: unused_import
import 'package:aula1/app/app_module.dart';
import 'package:aula1/app/app_widget.dart';
import 'package:aula1/app/modules/converter/converter_module.dart';
import 'package:aula1/app/modules/converter/domain/entities/currency_entity.dart';
import 'package:aula1/app/modules/converter/domain/entities/currency_information_entity.dart';
import 'package:aula1/app/modules/converter/domain/enums/currency_type_enum.dart';
import 'package:aula1/app/modules/converter/domain/repositories/currency_repository_interface.dart';
import 'package:aula1/app/modules/converter/domain/usecases/convert_currency.dart';
import 'package:aula1/app/modules/converter/infra/datasources/currency_datasource.dart';
import 'package:aula1/app/modules/converter/infra/repositories/currency_repository.dart';
import 'package:aula1/app/modules/converter/infra/repositories/datasources/currency_datasource_interface.dart';
import 'package:aula1/app/modules/converter/infra/repositories/models/currency_information_model.dart';
import 'package:aula1/app/modules/converter/presenter/pages/author/author_page.dart.dart';
import 'package:aula1/app/modules/converter/presenter/pages/home/home_controller.dart';
import 'package:aula1/app/modules/converter/presenter/pages/home/home_page.dart';
import 'package:aula1/app/modules/converter/presenter/pages/home/home_store.dart';
import 'package:aula1/app/modules/converter/presenter/pages/home/widgets/custom_text_field_widget.dart';
import 'package:aula1/app/modules/splash/presenter/pages/splash/splash_controller.dart';
import 'package:aula1/app/modules/splash/presenter/pages/splash/splash_page.dart';
import 'package:aula1/app/modules/splash/splash_module.dart';
import 'package:aula1/commons/adapters/navigation_adapter.dart';
import 'package:aula1/main.dart';

void main() {}
