import 'package:flutter/material.dart';
import 'package:sport_system_play/widgets/header.dart';

import '../../constants.dart';

class TemplatePage extends StatelessWidget {
  final Widget content;

  const TemplatePage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [Header(), SizedBox(height: defaultPadding), content],
        ),
      ),
    );
  }
}
