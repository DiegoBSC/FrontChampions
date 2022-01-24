import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_system_play_mono/blocs/bloc/userPageBloc/user_page_bloc.dart';
import 'package:sport_system_play_mono/constants.dart';
import 'package:sport_system_play_mono/screens/user/user_list_screen.dart';
import 'package:sport_system_play_mono/screens/user/user_new_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserPageBloc userPageBloc =
        BlocProvider.of<UserPageBloc>(context, listen: false);
    return BlocBuilder<UserPageBloc, UserPageState>(
      builder: (_, state) {
        if (state.userBlocModel!.statePage != null &&
            state.userBlocModel!.statePage == screenList) {
          return UserListScreen(
            userPageBloc: userPageBloc,
          );
        } else {
          return UserNewScreen(
            userPageBloc: userPageBloc,
          );
        }
      },
    );
  }
}
