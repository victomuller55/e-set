import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../telas/pastas_page_widget/pastas_page_widget.dart';
import 'elevated_button.dart';
import 'form_fields.dart';

getSlidable(Widget child, {bool? isTrash}) {
  return Slidable(
    key: const ValueKey(0),
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(onDismissed: () {}),
      children: isTrash == false || isTrash == null
          ? [
              SlidableAction(
                onPressed: (context) => {},
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Apagar',
              ),
            ]
          : [],
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) => {},
          backgroundColor: Colors.teal.shade400,
          foregroundColor: Colors.white,
          icon: Icons.archive,
          label: 'Arquivar',
        ),
        SlidableAction(
          onPressed: (context) => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PastasPageWidget())),
            Future.delayed(const Duration(milliseconds: 100)).then((value) => showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    backgroundColor: Colors.white,
                    child: SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(height: 5),
                              const Text("CRIAR PASTA", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 17)),
                              const SizedBox(height: 5),
                              getFormFieldPasta("Digite o nome da pasta..."),
                              getFormFieldPasta("Digite o endereço de e-mail..."),
                              const SizedBox(height: 5),
                              getElevatedButton(
                                color: Colors.teal,
                                onPressed: () => {
                                  Navigator.pop(context),
                                },
                                text: "CRIAR PASTA",
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
          },
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          icon: Icons.folder,
          label: 'Pasta',
        ),
      ],
    ),
    child: child,
  );
}


