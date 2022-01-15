import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sport_system_play/constants.dart';
import 'package:sport_system_play/services/auth_service.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          customButton: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2020/05/11/06/20/city-5156636_960_720.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          openWithLongPress: false,
          customItemsIndexes: const [3],
          customItemsHeight: 8,
          items: [
            ...MenuItems.firstItems.map(
              (item) => DropdownMenuItem<MenuItem>(
                value: item,
                child: MenuItems.buildItem(item),
              ),
            ),
            const DropdownMenuItem<Divider>(
                enabled: false,
                child: Divider(
                  height: 5,
                )),
            ...MenuItems.secondItems.map(
              (item) => DropdownMenuItem<MenuItem>(
                value: item,
                child: MenuItems.buildItem(item),
              ),
            ),
          ],
          onChanged: (value) {
            MenuItems.onChanged(context, value as MenuItem);
          },
          itemHeight: 48,
          itemWidth: 160,
          itemPadding: const EdgeInsets.only(left: 16, right: 16),
          dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: secondaryColor,
          ),
          dropdownElevation: 8,
          offset: const Offset(40, -4),
        ),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [profile];
  static const List<MenuItem> secondItems = [logout];

  static const profile = MenuItem(text: 'Perfil', icon: Icons.person_pin);
  static const logout = MenuItem(text: 'Salir', icon: Icons.exit_to_app);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(
          item.icon,
          color: Colors.white,
          size: 22,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.profile:
        //Do something
        break;
      case MenuItems.logout:
        Navigator.pushReplacementNamed(context, "login");
        AuthService.deleteToken();
        break;
    }
  }
}
