import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text('Conversor')),
      body: Column(
        children: [
          const Icon(Icons.monetization_on),
          CustomTextFieldWidget(
            key: const Key('txtBrl'),
            labelText: 'Real',
            prefix: 'R\$',
            controller: controller.txtReais,
            onChanged: controller.onRealChanged,
          ),
          CustomTextFieldWidget(
            key: const Key('txtUsd'),
            labelText: 'Dolar',
            prefix: 'USE',
            controller: controller.txtDolars,
            onChanged: controller.onDolarChanged,
          ),
          CustomTextFieldWidget(
            key: const Key('txtEur'),
            labelText: 'EURO',
            prefix: 'EUR',
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
    );
  }
}
