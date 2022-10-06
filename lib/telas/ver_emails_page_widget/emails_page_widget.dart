import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:organizador_de_email/app_widgets/email_model/email_model.dart';

import '../../widget/elevated_button.dart';
import '../../widget/slidable.dart';
import '../email_page_widget/email_page_widget.dart';

class VerEmailsPageWidget extends StatefulWidget {
  final String? title;

  const VerEmailsPageWidget({Key? key, this.title}) : super(key: key);

  @override
  State<VerEmailsPageWidget> createState() => _VerEmailsPageWidgetState();
}

class _VerEmailsPageWidgetState extends State<VerEmailsPageWidget> {
  List<dynamic> emailList = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('json/email1.json');
    final data = await json.decode(response);

    emailList = data['emails'].map((data) => EmailModel.fromJson(data)).toList();
  }

  String _getImage(EmailModel model) {
    if (emailList.isNotEmpty) {
      if (model == emailList[0]) {
        return 'https://upload.wikimedia.org/wikipedia/commons/c/c1/Steam_Logo.png';
      } else {
        return 'http://s2.glbimg.com/gg_5Qm3RGq-RVQtbsD0EBq4rlEU=/0x0:400x400/400x400/s.glbimg.com/es/ge/f/original/2016/06/02/ifood.png';
      }
    } else {
      return 'https://cdn1.vectorstock.com/i/thumb-large/77/30/default-avatar-profile-icon-grey-photo-placeholder-vector-17317730.jpg';
    }
  }

  _getEmails(EmailModel model) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EmailPageWidget(email: model.subject, from: model.from, subject: model.subject, body: model.body))),
      child: getSlidable(
          Container(
            height: 70,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10),
                    CircleAvatar(
                      backgroundImage: NetworkImage(_getImage(model)),
                      radius: 25,
                    ),
                    const SizedBox(width: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                model.from,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              SizedBox(
                                width: 250,
                                child: Text(
                                  model.subject,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    getFavoriteButton(isLiked2: widget.title.toString().toUpperCase() == "FAVORITOS" ? true : false),
                  ],
                ),
              ],
            ),
          ),
          isTrash: widget.title.toString().toUpperCase() == "LIXEIRA" ? true : false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title.toString().toUpperCase(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
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
          child: ListView(
            children: [
              const SizedBox(height: 10),
              Center(
                child: Text(widget.title.toString()),
              ),
              const Divider(color: Colors.black, height: 10),
              _getEmails(emailList.isNotEmpty ? emailList[0] : EmailModel(from: "noreply@steampowered.com", subject: "Dead Cells from your Steam wishlist is now on sale!", body: "1 GAME YOU'VE WISHED FOR IS ON SALE!", labels: ["ofertas"])),
              const Divider(color: Colors.black, height: 5),
              _getEmails(emailList.isNotEmpty ? emailList[1] : EmailModel(from: "no-reply@ifood.com", subject: "Cupom", body: "Cupom para Pizza", labels: ["spam", "ofertas"])),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
