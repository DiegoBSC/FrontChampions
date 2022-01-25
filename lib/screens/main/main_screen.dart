import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sport_system_play_mono/constants.dart';
import 'package:sport_system_play_mono/controllers/menu_controller.dart';
import 'package:sport_system_play_mono/responsive.dart';
import 'package:sport_system_play_mono/screens/dashboard/dashboard_screen.dart';
import 'package:sport_system_play_mono/screens/templates/template_pages.dart';
import 'package:sport_system_play_mono/screens/user/user_screen.dart';

import 'components/side_menu.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  String screenSelect;

  MainScreen({Key? key, required this.screenSelect}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(
        onSelectMenu: (value) {
          setState(() {
            widget.screenSelect = value;
          });
        },
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(
                  onSelectMenu: (value) {
                    setState(() {
                      widget.screenSelect = value;
                    });
                  },
                ),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 6,
              child: TemplatePage(
                content: buildPageBySelectMenu(widget.screenSelect),
                namePage: widget.screenSelect,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildPageBySelectMenu(String menuSelect) {
  if (menuSelect == "Dashboard") {
    return DashboardScreen();
  }
  if (menuSelect == "User") {
    return UserScreen();
  }
  return DashboardScreen();
}
