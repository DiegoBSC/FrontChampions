import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sport_system_play_mono/constants.dart';

viewAlert(BuildContext context, String title, String subtitle) {
  if (kIsWeb || Platform.isAndroid) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(subtitle),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Ok"),
                  elevation: 5,
                )
              ],
            ));
  }

  showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(subtitle),
            actions: [
              CupertinoDialogAction(
                child: Text("Ok"),
                isDefaultAction: true,
                onPressed: () => Navigator.pop(context),
              )
            ],
          ));
}

Future viewAlertConfirm(
    BuildContext context, String title, String subtitle) async {
  if (kIsWeb || Platform.isAndroid) {
    return await showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(subtitle),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text("Aceptar"),
                  elevation: 5,
                  color: successColor,
                ),
                MaterialButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text("Cancelar"),
                  elevation: 5,
                  color: dangerColor,
                )
              ],
            ));
  }

  await showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(subtitle),
            actions: [
              CupertinoDialogAction(
                child: Text("Aceptar"),
                isDefaultAction: true,
                onPressed: () => Navigator.pop(context, true),
              ),
              CupertinoDialogAction(
                child: Text("Cancelar"),
                isDefaultAction: true,
                onPressed: () => Navigator.pop(context, false),
              )
            ],
          ));
}
