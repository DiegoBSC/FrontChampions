import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_system_play/blocs/bloc/user_bloc.dart';
import 'package:sport_system_play/constants.dart';
import 'package:sport_system_play/responsive.dart';
import 'package:sport_system_play/widgets/content_page.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserBloc>(context, listen: false)
        .add(UserListEvent(0, 10, "61aea3a65fef67760c318eff"));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  ElevatedButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF6aa84f),
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5,
                        vertical: defaultPadding /
                            (Responsive.isMobile(context) ? 2 : 1),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text("Nuevo"),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ContentPage(
                titleContent: '',
              )
            ],
          ),
        ),
      ],
    );
  }
}
