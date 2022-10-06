import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

Widget getElevatedButton({String? text, void Function()? onPressed, double? width, double? height, Color? color, Color? textColor, Color? colorShadow}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          offset: const Offset(5, 10),
          color: colorShadow ?? Colors.grey.shade300,
          blurRadius: 10,
        )
      ],
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10.0),
        primary: color ?? Colors.white,
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        alignment: Alignment.center,
        minimumSize: Size(width ?? 400, height ?? 50),
      ),
      onPressed: onPressed ?? () => {},
      child: Text(
        text!.toUpperCase(),
        style: TextStyle(color: textColor ?? Colors.white),
      ),
    ),
  );
}

getFavoriteButton({IconData? icon, isLiked2}) {
  return LikeButton(
    circleColor: const CircleColor(start: Color.fromRGBO(5, 95, 82, 1), end: Color.fromRGBO(5, 80, 82, 1)),
    likeBuilder: (bool isLiked) {
      return Icon(
        Icons.star,
        color: isLiked || isLiked2 ? Colors.yellow.shade800 : Colors.grey,
        size: 22,
      );
    },
  );
}

getConfiguracaoButton(BuildContext context, {String? text, IconData? icon}) {
  final ThemeData mode = Theme.of(context);

  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(color: mode.brightness == Brightness.light ? Colors.grey.shade300 : Colors.grey.shade700, borderRadius: BorderRadius.circular(5)),
    child: Center(
      child: ListTile(
        leading: Icon(icon ?? Icons.settings, color: mode.brightness == Brightness.light ? Colors.grey.shade600 : Colors.white),
        title: Text(text ?? "Configuração", style: TextStyle(fontWeight: FontWeight.bold, color: mode.brightness == Brightness.light ? Colors.grey.shade600 : Colors.white)),
        trailing: Icon(Icons.arrow_forward_ios_sharp, color: mode.brightness == Brightness.light ? Colors.grey.shade600 : Colors.white),
      ),
    ),
  );
}

getConfiguracaoButtonImage(BuildContext context, {String? text, String? assetImage}) {

  final ThemeData mode = Theme.of(context);

  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(color: mode.brightness == Brightness.light ? Colors.grey.shade300 : Colors.grey.shade700, borderRadius: BorderRadius.circular(5)),
    child: Center(
      child: ListTile(
        leading: const CircleAvatar(backgroundImage: NetworkImage('https://cdn1.vectorstock.com/i/thumb-large/77/30/default-avatar-profile-icon-grey-photo-placeholder-vector-17317730.jpg'), radius: 20),
        title: Text(text ?? "Configuração", style: TextStyle(fontWeight: FontWeight.bold, color: mode.brightness == Brightness.light ? Colors.grey.shade600 : Colors.white)),
        trailing: Icon(Icons.arrow_forward_ios_sharp, color: mode.brightness == Brightness.light ? Colors.grey.shade600 : Colors.white),
      ),
    ),
  );
}

// CircleAvatar(backgroundImage: AssetImage(assetImage.toString()),radius: 20)

getConfiguracaoButtonSairDaConta(BuildContext context, {String? text}) {
  final ThemeData mode = Theme.of(context);

  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(color: mode.brightness == Brightness.light ? Colors.grey.shade300 : Colors.grey.shade700, borderRadius: BorderRadius.circular(5)),
    child: Center(
      child: ListTile(
        leading: const Icon(Icons.logout, color: Colors.red),
        title: Text(text ?? "Sair da conta", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
        trailing: const Icon(Icons.arrow_forward_ios_sharp, color: Colors.red),
      ),
    ),
  );
}
