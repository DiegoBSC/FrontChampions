import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_system_play/controllers/menu_controller.dart';
import 'package:sport_system_play/responsive.dart';
import 'package:sport_system_play/screens/dashboard/dashboard_screen.dart';
import 'package:sport_system_play/screens/templates/template_pages.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: TemplatePage(
                content: DashboardScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
