part of 'user_page_bloc.dart';

@immutable
abstract class UserPageState {
  final UserBlocModel? userBlocModel;
  const UserPageState({this.userBlocModel});
}

class UserInitial extends UserPageState {
  UserInitial()
      : super(
            userBlocModel: UserBlocModel(
                userSelect: null,
                paginatorUserModel: null,
                statePage: screenList));
}

class UserSet extends UserPageState {
  final UserBlocModel newUserBlocModel;
  const UserSet(this.newUserBlocModel) : super(userBlocModel: newUserBlocModel);
}
