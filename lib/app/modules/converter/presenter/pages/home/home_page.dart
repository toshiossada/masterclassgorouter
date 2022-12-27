import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../../../../commons/adapters/navigation_adapter.dart';
import 'home_controller.dart';
import 'widgets/custom_text_field_widget.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController get controller => widget.controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home_page_title'.i18n())),
      body: Column(
        children: [
          const Icon(Icons.monetization_on),
          CustomTextFieldWidget(
            key: const Key('txtBrl'),
            labelText: 'brl_label'.i18n(),
            prefix: 'brl_prefix'.i18n(),
            controller: controller.txtReais,
            onChanged: controller.onRealChanged,
          ),
          CustomTextFieldWidget(
            key: const Key('txtUsd'),
            labelText: 'us_label'.i18n(),
            prefix: 'us_prefix'.i18n(),
            controller: controller.txtDolars,
            onChanged: controller.onDolarChanged,
          ),
          CustomTextFieldWidget(
            key: const Key('txtEur'),
            labelText: 'eur_label'.i18n(),
            prefix: 'eur_prefix'.i18n(),
            controller: controller.txtEuros,
            onChanged: controller.onEuroChanged,
          ),
          ValueListenableBuilder<bool>(
            valueListenable: controller.store,
            builder: (context, value, child) {
              return Visibility(
                  visible: value,
                  child: const Center(child: CircularProgressIndicator()));
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          context.pushNamed('created');
        },
      ),
    );
  }
}
