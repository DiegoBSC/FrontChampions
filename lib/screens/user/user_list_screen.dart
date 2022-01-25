import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_system_play_mono/blocs/bloc/userPageBloc/user_page_bloc.dart';
import 'package:sport_system_play_mono/constants.dart';
import 'package:sport_system_play_mono/responsive.dart';
import 'package:sport_system_play_mono/widgets/content_page.dart';
import 'package:sport_system_play_mono/widgets/list_table_user.dart';
import 'package:sport_system_play_mono/widgets/paginator.dart';

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
    widget.userPageBloc.add(UserListEvent(0, 6));
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(),
                  ElevatedButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: successColor,
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
                  SizedBox(
                    width: 20,
                  ),
                  widget.userPageBloc.state.userBlocModel!.paginatorUserModel !=
                          null
                      ? Paginator(
                          totalPage: widget.userPageBloc.state.userBlocModel!
                              .paginatorUserModel!.totalPages!,
                          page: widget.userPageBloc.state.userBlocModel!.page!,
                          size: 6,
                          onChangePage: (value) {
                            widget.userPageBloc.add(UserListEvent(value, 6));
                          },
                        )
                      : Text("cargando")
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
