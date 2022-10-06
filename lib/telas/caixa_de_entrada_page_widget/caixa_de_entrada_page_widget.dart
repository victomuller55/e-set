import 'dart:convert';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:organizador_de_email/app_widgets/email_model/email_model.dart';
import 'package:organizador_de_email/widget/form_fields.dart';
import 'package:organizador_de_email/widget/slidable.dart';

import '../../widget/drawer.dart';
import '../../widget/elevated_button.dart';
import '../email_page_widget/email_page_widget.dart';
import '../pastas_page_widget/pastas_page_widget.dart';
import '../ver_emails_page_widget/emails_page_widget.dart';

class CaixaDeEntradaPageWidget extends StatefulWidget {
  const CaixaDeEntradaPageWidget({Key? key}) : super(key: key);

  @override
  State<CaixaDeEntradaPageWidget> createState() => _CaixaDeEntradaPageWidgetState();
}

class _CaixaDeEntradaPageWidgetState extends State<CaixaDeEntradaPageWidget> {
  TextEditingController controller = TextEditingController();
  List<dynamic> emailList = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('json/email1.json');
    final data = await json.decode(response);
    emailList = data['emails'].map((data) => EmailModel.fromJson(data)).toList();
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  _getOpcao(caixa, icon) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VerEmailsPageWidget(title: caixa))),
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(10.0),
                  primary: Colors.teal,
                  textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  alignment: Alignment.center,
                  minimumSize: const Size(150, 40),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        caixa,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Icon(icon, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 1000) {
              return const SizedBox(height: 10);
            } else {
              return const SizedBox(height: 0);
            }
          },
        )
      ],
    );
  }

  _getEmails(EmailModel model) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EmailPageWidget(email: model.subject, from: model.from, subject: model.subject, body: model.body))),
          child: Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            color: emailList.length % 2 == 0 ? Colors.white : Colors.grey.shade400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10),
                    CircleAvatar(
                        backgroundImage: NetworkImage(
                          emailList.isNotEmpty
                              ? model == emailList[0]
                                  ? 'https://upload.wikimedia.org/wikipedia/commons/c/c1/Steam_Logo.png'
                                  : 'http://s2.glbimg.com/gg_5Qm3RGq-RVQtbsD0EBq4rlEU=/0x0:400x400/400x400/s.glbimg.com/es/ge/f/original/2016/06/02/ifood.png'
                              : 'https://cdn1.vectorstock.com/i/thumb-large/77/30/default-avatar-profile-icon-grey-photo-placeholder-vector-17317730.jpg',
                        ),
                        radius: 25),
                    const SizedBox(width: 20),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (MediaQuery.of(context).size.width > 1000) {
                          return Container(
                            width: MediaQuery.of(context).size.width - 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        model.subject,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        model.from,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );

                        } else if(MediaQuery.of(context).size.width < 1000) {

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        model.subject,
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        model.from,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    getFavoriteButton(isLiked2: false),
                  ],
                ),
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }

  _switchOpcoes(List<Widget> list) {
    for (int i = 1; i <= 7; i++) {
      String caixa = '';

      IconData icon = Icons.disabled_by_default;

      switch (i) {
        case 1:
          caixa = "Lixeira";
          icon = Icons.delete;
          break;
        case 2:
          caixa = "Favoritos";
          icon = Icons.star;
          break;
        case 3:
          caixa = "Spam";
          icon = Icons.warning_rounded;
          break;
        case 4:
          caixa = "Importantes";
          icon = Icons.double_arrow_outlined;
          break;
        case 5:
          caixa = "Racunhos";
          icon = Icons.edit;
          break;
        case 6:
          caixa = "Enviados";
          icon = Icons.send;
          break;
        case 7:
          caixa = "Arquivados";
          icon = Icons.indeterminate_check_box_outlined;
          break;
        default:
          icon = Icons.person;
          caixa = "NADA";
      }

      list.add(
        _getOpcao(caixa, icon),
      );
    }
  }

  _bodyCellphone() {

    List<Widget> listOpcoes = [];

    _switchOpcoes(listOpcoes);

    return Scaffold(
      drawer: getDrawer(context),
      appBar: AppBar(
        title: const Text("HOME"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  AnimSearchBar(
                    width: MediaQuery.of(context).size.width - 10,
                    textController: controller,
                    onSuffixTap: () => {},
                    prefixIcon: const Icon(Icons.search_rounded, color: Colors.teal),
                    color: Colors.white,
                    suffixIcon: const Icon(Icons.search, color: Colors.teal),
                    animationDurationInMilli: 300,
                    helpText: "Pesquisar email",
                  ),
                  const SizedBox(width: 10),
                  ...listOpcoes
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 20,
                    spreadRadius: 10,
                    offset: Offset(10, 10),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 156,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Center(
                    child: Text("CAIXA DE ENTRADA"),
                  ),
                  const Divider(color: Colors.black, height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 192,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: [
                        getSlidable(_getEmails(emailList.isNotEmpty ? emailList[0] : EmailModel(from: "noreply@steampowered.com", subject: "Dead Cells from your Steam wishlist is now on sale!", body: "1 GAME YOU'VE WISHED FOR IS ON SALE!", labels: ["ofertas"]))),
                        getSlidable(_getEmails(emailList.isNotEmpty ? emailList[1] : EmailModel(from: "no-reply@ifood.com", subject: "Cupom", body: "Cupom para Pizza", labels: ["spam", "ofertas"]))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PastasPageWidget()));
        },
        child: const Icon(Icons.folder),
      ),
    );
  }

  _bodyWeb() {
    List<Widget> listOpcoes = [];

    _switchOpcoes(listOpcoes);

    return Scaffold(
      drawer: getDrawer(context),
      appBar: AppBar(
        title: const Text("HOME"),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: getFormField(context, 'Pesquisar'),
          ),
          IconButton(
            icon: Icon(Icons.settings_backup_restore),
            onPressed: () => {},
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      ...listOpcoes,
                      SizedBox(height: 100),
                      RotatedBox(quarterTurns: -45, child: Image.asset('images/logo.png')),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 10,
                        spreadRadius: 10,
                        offset: Offset(10, 10),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width - 180,
                  height: MediaQuery.of(context).size.height - 75,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Center(
                        child: Text("CAIXA DE ENTRADA"),
                      ),
                      const Divider(color: Colors.black, height: 10),
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 192,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          children: [
                            getSlidable(_getEmails(emailList.isNotEmpty ? emailList[0] : EmailModel(from: "noreply@steampowered.com", subject: "Dead Cells from your Steam wishlist is now on sale!", body: "1 GAME YOU'VE WISHED FOR IS ON SALE!", labels: ["ofertas"]))),
                            getSlidable(_getEmails(emailList.isNotEmpty ? emailList[1] : EmailModel(from: "no-reply@ifood.com", subject: "Cupom", body: "Cupom para Pizza", labels: ["spam", "ofertas"]))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Abrir pastas',
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PastasPageWidget()));
        },
        child: const Icon(Icons.folder),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1000) {
          return _bodyWeb();
        } else {
          return _bodyCellphone();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
