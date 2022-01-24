import 'package:flutter/material.dart';
import 'package:sport_system_play_mono/responsive.dart';
import 'package:sport_system_play_mono/widgets/my_files.dart';
import 'package:sport_system_play_mono/widgets/recent_files.dart';
import 'package:sport_system_play_mono/widgets/statistical_details.dart';

import '../../constants.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              MyFiles(),
              SizedBox(height: defaultPadding),
              RecentFiles(),
              if (Responsive.isMobile(context))
                SizedBox(height: defaultPadding),
              if (Responsive.isMobile(context)) StatisticalDetails(),
            ],
          ),
        ),
        if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
        // On Mobile means if the screen is less than 850 we dont want to show it
        if (!Responsive.isMobile(context))
          Expanded(
            flex: 2,
            child: StatisticalDetails(),
          ),
      ],
    );
  }
}
