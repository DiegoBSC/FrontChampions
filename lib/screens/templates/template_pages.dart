import 'package:flutter/material.dart';
import 'package:sport_system_play/widgets/header.dart';

import '../../constants.dart';

class TemplatePage extends StatelessWidget {
  final Widget content;
  final String namePage;

  const TemplatePage({Key? key, required this.content, required this.namePage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(namePage: namePageLabel(namePage)),
            SizedBox(height: defaultPadding),
            content
          ],
        ),
      ),
    );
  }
}

String namePageLabel(String namePage) {
  switch (namePage) {
    case "Dashboard":
      return "Dashboard";
    case "User":
      return "Usuario";
  }
  return "Dashboard";
}
