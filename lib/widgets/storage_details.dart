import 'package:flutter/material.dart';
import 'package:sport_system_play/widgets/chart.dart';
import 'package:sport_system_play/widgets/storage_info_card.dart';

import '../../../constants.dart';

class StarageDetails extends StatelessWidget {
  const StarageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Estadisticas Mensuales",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            svgSrc: "assets/icons/soccer-ball_icon.svg",
            title: "Cancha 01",
            amountOfFiles: "15.3",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/soccer-ball_icon.svg",
            title: "Cancha 02",
            amountOfFiles: "1.3",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/soccer-ball_icon.svg",
            title: "Cancha 03",
            amountOfFiles: "1.3",
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/soccer-ball_icon.svg",
            title: "Sin uso",
            amountOfFiles: "1.3",
            numOfFiles: 1328,
          ),
        ],
      ),
    );
  }
}
