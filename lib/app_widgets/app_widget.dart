import 'package:flutter/material.dart';
import 'package:organizador_de_email/app_widgets/theme.dart';
import 'package:organizador_de_email/telas/caixa_de_entrada_page_widget/caixa_de_entrada_page_widget.dart';

import '../telas/login_page_widget/login_page_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: MyThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const CaixaDeEntradaPageWidget(),
    );
  }
}