import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SideMenu extends StatefulWidget {
  Function(String)? onSelectMenu;

  SideMenu({Key? key, this.onSelectMenu}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Image.asset("assets/images/Logo-01.png"),
              padding: EdgeInsets.all(30)),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/dashboard.svg",
            press: () {
              widget.onSelectMenu!("Dashboard");
            },
          ),
          DrawerListTile(
            title: "Usuarios",
            svgSrc: "assets/icons/user.svg",
            press: () {
              widget.onSelectMenu!("User");
            },
          ),
          DrawerListTile(
            title: "Complejo",
            svgSrc: "assets/icons/soccer-ball_icon.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Reservas",
            svgSrc: "assets/icons/flexiblechagedatecalenda.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Productos",
            svgSrc: "assets/icons/product.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Ventas",
            svgSrc: "assets/icons/sales.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Notificaciones",
            svgSrc: "assets/icons/notifications.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Perfil",
            svgSrc: "assets/icons/user_profile_icon.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Configuraciones",
            svgSrc: "assets/icons/config.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white70,
        height: 18,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white70),
      ),
    );
  }
}
