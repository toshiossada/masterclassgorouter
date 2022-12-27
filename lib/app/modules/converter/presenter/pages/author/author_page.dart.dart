import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

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
        title: Text('created_page_title'.i18n()),
      ),
      body: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Text('${'created_by_label'.i18n()} Toshi Ossada'),
            ),
          ],
        ),
      ),
    );
  }
}
