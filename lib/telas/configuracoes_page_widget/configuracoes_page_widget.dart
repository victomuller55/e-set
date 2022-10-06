import 'package:flutter/material.dart';

import '../../widget/drawer.dart';
import '../../widget/elevated_button.dart';
import '../../widget/pop_ups.dart';

class ConfiguracoesPageWidget extends StatefulWidget {
  const ConfiguracoesPageWidget({Key? key}) : super(key: key);

  @override
  State<ConfiguracoesPageWidget> createState() => _ConfiguracoesPageWidgetState();
}

class _ConfiguracoesPageWidgetState extends State<ConfiguracoesPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: getDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("CONFIGURAÇÕES"),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            getConfiguracaoButtonImage(context, text: "Conta", assetImage: 'images/henrique.jpeg'),
            const SizedBox(height: 10),
            getConfiguracaoButton(context, text: "Notificação", icon: Icons.notifications),
            const SizedBox(height: 10),
            getConfiguracaoButton(context, text: "Ajuda e Suporte", icon: Icons.help),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => getPopUp(context),
              child: getConfiguracaoButtonSairDaConta(context),
            ),
          ],
        ),
      ),
    );
  }
}
