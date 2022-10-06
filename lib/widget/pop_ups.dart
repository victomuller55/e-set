import 'package:flutter/material.dart';

import '../telas/login_page_widget/login_page_widget.dart';
import 'elevated_button.dart';

getPopUp(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.warning, color: Colors.red, size: 70),
              Text("Deseja realmente a sair da conta ?".toUpperCase(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  getElevatedButton(text: "SIM", color: Colors.red, width: 125, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPageWidget()))),
                  getElevatedButton(text: "NÃO", color: Colors.teal, width: 125, onPressed: () => Navigator.pop(context)),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

getPopUpDeleteEmail(BuildContext context) {

  const snackBar = SnackBar(content: Text('E-mail apagado com sucesso !!'), backgroundColor: Colors.teal);

  _voltaPaginas() {
    Future apaga = Future.delayed(const Duration(milliseconds: 100));

    Navigator.pop(context);

    apaga.then((value) => Navigator.pop(context));
  }

  return showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.warning, color: Colors.red, size: 70),
              Text("Você deseja apagar o email ?".toUpperCase(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  getElevatedButton(text: "SIM", color: Colors.red, width: 125, onPressed: () => {ScaffoldMessenger.of(context).showSnackBar(snackBar), _voltaPaginas()}),
                  getElevatedButton(text: "NÃO", color: Colors.teal, width: 125, onPressed: () => Navigator.pop(context)),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

getPopUpErroLogin(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.warning, color: Colors.red, size: 70),
              Text("Senha ou e-mail incorretos".toUpperCase(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    ),
  );
}