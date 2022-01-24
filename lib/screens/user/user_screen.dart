import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_system_play_mono/blocs/bloc/user_bloc.dart';
import 'package:sport_system_play_mono/constants.dart';
import 'package:sport_system_play_mono/responsive.dart';
import 'package:sport_system_play_mono/widgets/content_page.dart';
import 'package:sport_system_play_mono/widgets/list_table_user.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserBloc>(context, listen: false).add(UserListEvent(0, 10));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
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
              BlocBuilder<UserBloc, UserState>(
                builder: (_, state) {
                  if (state.paginatorUserModel != null &&
                      state.paginatorUserModel!.data!.isNotEmpty) {
                    return ContentPage(
                      titleContent: 'Usuarios Registrados',
                      dataContent: ListTableUser(
                        paginator: state.paginatorUserModel,
                      ),
                    );
                  } else {
                    return Text("No existe usuarios");
                  }
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
