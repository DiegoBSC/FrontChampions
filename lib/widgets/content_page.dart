import 'package:flutter/material.dart';
import 'package:sport_system_play/constants.dart';

class ContentPage extends StatelessWidget {
  final String titleContent;
  const ContentPage({Key? key, required this.titleContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: Container(
        height: MediaQuery.of(context).size.height - 150,
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleContent,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
