
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:process_run/which.dart';
import '../../widget/elevated_button.dart';
import '../../widget/form_fields.dart';
import '../../widget/pop_ups.dart';
import 'package:process_run/shell.dart';
import '../caixa_de_entrada_page_widget/caixa_de_entrada_page_widget.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {

  TextEditingController controllerSenha = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 10),
                  SizedBox(width: 700, child: Image.asset("images/logo.png")),
                  Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(MediaQuery.of(context).size.width > 1000 ? 0 : 40), topRight: Radius.circular(MediaQuery.of(context).size.width > 1000 ? 0 : 40)),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, -10),
                          color: Colors.grey.shade500,
                          blurRadius: 100,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        getFormField(context, 'Digite o email', controller: controllerEmail, ),
                        const SizedBox(height: 10),
                        getFormField(context, 'Digite a senha', isSenha: true, controller: controllerSenha),
                        const SizedBox(height: 20),
                        getElevatedButton(
                          text: "login",
                          color: Colors.teal.shade700,
                          width: 250,
                          height: 50,
                          colorShadow: Colors.teal.shade700,
                          onPressed: () async {

                            if (controllerSenha.text == '12345' && controllerEmail.text == 'teste@gmail.com') {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const CaixaDeEntradaPageWidget()));
                            } else {
                              getPopUpErroLogin(context);
                            }

                          },
                        ),
                        const SizedBox(height: 30),
                        const Text("Esqueci minha senha", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
