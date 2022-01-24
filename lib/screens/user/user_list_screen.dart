import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_system_play_mono/blocs/bloc/userPageBloc/user_page_bloc.dart';
import 'package:sport_system_play_mono/constants.dart';
import 'package:sport_system_play_mono/responsive.dart';
import 'package:sport_system_play_mono/widgets/content_page.dart';
import 'package:sport_system_play_mono/widgets/list_table_user.dart';

class UserListScreen extends StatefulWidget {
  final UserPageBloc userPageBloc;
  const UserListScreen({Key? key, required this.userPageBloc})
      : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    widget.userPageBloc.add(UserListEvent(0, 2));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {
                      widget.userPageBloc.add(UserScreenEvent(screenNew));
                    },
                    icon: Icon(Icons.add),
                    label: Text("Nuevo"),
                  ),
                  ElevatedButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF6aa84f),
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5,
                        vertical: defaultPadding /
                            (Responsive.isMobile(context) ? 2 : 1),
                      ),
                    ),
                    onPressed: () {
                      widget.userPageBloc.add(UserListEvent(1, 2));
                    },
                    icon: Icon(Icons.add),
                    label: Text("Siguiente"),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              BlocBuilder<UserPageBloc, UserPageState>(
                builder: (_, state) {
                  if (state.userBlocModel!.paginatorUserModel != null &&
                      state.userBlocModel!.paginatorUserModel!.data!
                          .isNotEmpty) {
                    return ContentPage(
                      titleContent: 'Usuarios Registrados',
                      dataContent: ListTableUser(
                        paginator: state.userBlocModel!.paginatorUserModel,
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
