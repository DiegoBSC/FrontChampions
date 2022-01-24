import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_system_play_mono/controllers/menu_controller.dart';
import 'package:sport_system_play_mono/responsive.dart';
import 'package:sport_system_play_mono/widgets/profile_card.dart';
import 'package:sport_system_play_mono/widgets/search_field.dart';

class Header extends StatefulWidget {
  final String namePage;
  const Header({Key? key, required this.namePage}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            widget.namePage,
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),
        SizedBox(
          width: 20,
        ),
        ProfileCard()
      ],
    );
  }
}
