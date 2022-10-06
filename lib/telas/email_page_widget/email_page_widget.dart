import 'package:flutter/material.dart';

import '../../widget/elevated_button.dart';
import '../../widget/pop_ups.dart';

class EmailPageWidget extends StatefulWidget {
  String? email;
  String? from;
  String? subject;
  String? body;

  EmailPageWidget({Key? key, required this.email, required this.from, required this.subject, required this.body}) : super(key: key);

  @override
  State<EmailPageWidget> createState() => _EmailPageWidgetState();
}

class _EmailPageWidgetState extends State<EmailPageWidget> {

  Image getImage() {
    if (widget.from == "no-reply@ifood.com") {
      return Image.network("https://i.pinimg.com/originals/f6/0c/d7/f60cd71c8458c55ccf750db6640f3848.png");
    } else {
      return Image.network("https://img.g2a.com/323x433/1x1x0/dead-cells-steam-key-global/592bc5105bafe348b17731a2");
    }
  }

  Widget _getCabecalho() {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                const Text("DE: "),
                Text(widget.from.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            Row(
              children: const [
                Text("PARA: "),
                Text("matheusttomaz75@gmail.com ", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getData({required String data}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(data, style: const TextStyle(fontWeight: FontWeight.bold)),
                const Text("7 de jun"),
              ],
            ),
            getFavoriteButton(isLiked2: false),
          ],
        ),
      ),
    );
  }

  Widget _getTitle({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 310,
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _getOpcoes(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: IconButton(onPressed: () => {}, icon: Icon(icon, color: Colors.teal)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.email.toString()),
        actions: [IconButton(onPressed: () => getPopUpDeleteEmail(context), icon: const Icon(Icons.delete))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _getCabecalho(),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(6, 6),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _getData(data: "7 de junho"),
                        _getTitle(title: widget.subject.toString()),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(widget.body.toString(), style: TextStyle(color: Colors.grey.shade800)),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: getImage()),
                        ),
                        // Footer
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _getOpcoes(Icons.share),
                                _getOpcoes(Icons.ios_share),
                                _getOpcoes(Icons.whatsapp),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
