import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  // final String onSelectSubMenu;
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Image.asset("assets/images/logo_principal.png"),
              padding: EdgeInsets.all(30)),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/dashboard.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Usuarios",
            svgSrc: "assets/icons/user.svg",
            press: () {},
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
