import 'package:flutter/material.dart';

getFormField(BuildContext context, String text, {Color? color, bool? isSenha, TextEditingController? controller, TextAlign? textAlign}) {
  return Container(
    width: 350,
    height: MediaQuery.of(context).size.width > 1000 ? 65 : 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: color ?? Colors.grey.shade300,
      boxShadow: [
        BoxShadow(
          offset: const Offset(5, 10),
          color: Colors.teal.shade700,
          blurRadius: 10,
        )
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Center(
          child: TextFormField(
            controller: controller,
            obscureText: isSenha ?? false,
            textAlign: textAlign ?? TextAlign.left,
            decoration: InputDecoration(
              hintText: text,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    ),
  );
}

getFormFieldPasta(String text, {Color? color, TextEditingController? controller}) {
  return Container(
    width: 350,
    height: 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: color ?? Colors.grey.shade300,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Center(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: text,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    ),
  );
}

getFormFieldPesquisar(BuildContext context, String text, {Color? color, bool? isSenha, TextEditingController? controller, TextAlign? textAlign}) {
  return Container(
    width: 350,
    height: 30,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: color ?? Colors.grey.shade300,
      boxShadow: [
        BoxShadow(
          offset: const Offset(5, 10),
          color: Colors.teal.shade700,
          blurRadius: 10,
        )
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Center(
          child: TextFormField(
            controller: controller,
            obscureText: isSenha ?? false,
            textAlign: textAlign ?? TextAlign.left,
            decoration: InputDecoration(
              hintText: text,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    ),
  );
}
