import 'package:flutter/material.dart';

import '../../widget/drawer.dart';
import '../../widget/elevated_button.dart';
import '../../widget/form_fields.dart';
import '../ver_emails_page_widget/emails_page_widget.dart';

class PastasPageWidget extends StatefulWidget {
  const PastasPageWidget({Key? key}) : super(key: key);

  @override
  State<PastasPageWidget> createState() => _PastasPageWidgetState();
}

class _PastasPageWidgetState extends State<PastasPageWidget> {
  final TextEditingController _nomePastaController = TextEditingController();
  List<Widget> pastas = [];
  int color = 0;

  _pasta(String nomePasta) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => VerEmailsPageWidget(title: nomePasta))),
      child: Container(
        color: color % 2 == 0 ? Colors.grey.shade100 : Colors.white,
        child: ListTile(
          title: Row(
            children: [
              Text(nomePasta, style: const TextStyle(color: Colors.black)),
              const Text("  - 2 e-mails", style: TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
          leading: SizedBox(height: 30, child: Image.network("https://icons-for-free.com/download-icon-folder-131964753094019398_512.png")),
          trailing: const Icon(Icons.arrow_forward_ios_sharp),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: getDrawer(context),

      //AppBar
      appBar: AppBar(
        title: const Text("PASTAS"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => Dialog(
                backgroundColor: Colors.white,
                child: SizedBox(
                  height: 250,
                  width: 300,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 5),
                          const Text("CRIAR PASTA", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 17)),
                          const SizedBox(height: 5),
                          getFormFieldPasta("Digite o nome da pasta...", controller: _nomePastaController),
                          getFormFieldPasta("Digite o endereço de e-mail..."),
                          const SizedBox(height: 5),
                          getElevatedButton(
                              color: Colors.teal,
                              onPressed: () => {
                                    Navigator.pop(context),
                                    setState(() {
                                      pastas.add(_pasta(_nomePastaController.text));
                                    }),
                                    color++,
                                  },
                              text: "CRIAR PASTA"),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),

      //Body
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: pastas.isEmpty
                    ? Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  SizedBox(child: Image.network("https://cdn4.iconfinder.com/data/icons/folders-interaction-assets-vol-2/121/folder-empty-no-wrong-error-512.png"), height: 80),
                                  const Text("Sem pastas criadas."),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : Column(children: pastas),
              ),
            ],
          )
        ],
      ),
    );
  }
}
