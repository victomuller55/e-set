import 'package:flutter/material.dart';
import 'package:organizador_de_email/widget/pop_ups.dart';

import '../telas/caixa_de_entrada_page_widget/caixa_de_entrada_page_widget.dart';
import '../telas/configuracoes_page_widget/configuracoes_page_widget.dart';
import '../telas/pastas_page_widget/pastas_page_widget.dart';


Drawer getDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Colors.teal.shade300,
    child: Column(
      children: [
        const SizedBox(height: 70),
        SizedBox(
          width: 250,
          child: Image.asset('images/logo.png'),
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CaixaDeEntradaPageWidget())),
          child: const ListTile(
            title: Text("Inicio", style: TextStyle(color: Colors.white)),
            leading: Icon(Icons.home, color: Colors.white),
            trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.white),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PastasPageWidget())),
          child: const ListTile(
            title: Text("Pastas", style: TextStyle(color: Colors.white)),
            leading: Icon(Icons.folder, color: Colors.white),
            trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.white),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ConfiguracoesPageWidget())),
          child: const ListTile(
            title: Text("Configurações", style: TextStyle(color: Colors.white)),
            leading: Icon(Icons.settings, color: Colors.white),
            trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.white),
          ),
        ),
        GestureDetector(
          onTap: () => getPopUp(context),
          child: ListTile(
            title: Text("Sair da conta", style: TextStyle(color: Colors.red.shade800)),
            leading: Icon(Icons.logout, color: Colors.red.shade800),
            trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.red.shade800),
          ),
        ),
      ],
    ),
  );
}