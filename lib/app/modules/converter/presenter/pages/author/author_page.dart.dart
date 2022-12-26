import 'package:flutter/material.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({super.key}) : super();

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de Moedas'),
      ),
      body: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Center(
              child: Text('Criado na MasterClass'),
            ),
          ],
        ),
      ),
    );
  }
}
