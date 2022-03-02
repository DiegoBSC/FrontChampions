part of 'user_page_bloc.dart';

@immutable
abstract class UserPageState {
  final UserBlocModel? userBlocModel;
  final bool loading;
  const UserPageState({this.userBlocModel, required this.loading});
}

class UserInitial extends UserPageState {
  UserInitial()
      : super(
            userBlocModel: UserBlocModel(
                userSelect: null,
                paginatorUserModel: null,
                statePage: screenList,
                page: 0),
            loading: false);
}

class UserSet extends UserPageState {
  final UserBlocModel newUserBlocModel;
  const UserSet(this.newUserBlocModel)
      : super(userBlocModel: newUserBlocModel, loading: false);
}

class LoadingSet extends UserPageState {
  final bool loadingPage;
  final UserBlocModel userBlocModelCopy;
  const LoadingSet(this.loadingPage, this.userBlocModelCopy)
      : super(loading: loadingPage, userBlocModel: userBlocModelCopy);
}
