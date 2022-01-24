import 'package:flutter/material.dart';
import 'package:sport_system_play_mono/blocs/bloc/userPageBloc/user_page_bloc.dart';
import 'package:sport_system_play_mono/constants.dart';
import 'package:sport_system_play_mono/responsive.dart';
import 'package:sport_system_play_mono/widgets/content_page.dart';

class UserNewScreen extends StatefulWidget {
  final UserPageBloc userPageBloc;
  const UserNewScreen({Key? key, required this.userPageBloc}) : super(key: key);

  @override
  State<UserNewScreen> createState() => _UserNewScreenState();
}

class _UserNewScreenState extends State<UserNewScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ContentPage(
                titleContent: 'Nuevo Usuario',
                dataContent: ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF6aa84f),
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding /
                          (Responsive.isMobile(context) ? 2 : 1),
                    ),
                  ),
                  onPressed: () {
                    widget.userPageBloc.add(UserScreenEvent(screenList));
                  },
                  icon: Icon(Icons.add),
                  label: Text("Cancelar"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
