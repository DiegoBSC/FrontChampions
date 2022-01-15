part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final UserPresenter? userPresenter;
  final PaginatorUserModel? paginatorUserModel;

  const UserState({this.userPresenter, this.paginatorUserModel});
}

class UserInitial extends UserState {
  const UserInitial() : super(userPresenter: null, paginatorUserModel: null);
}

class UserSet extends UserState {
  final UserPresenter newUserPresenter;
  const UserSet(this.newUserPresenter) : super(userPresenter: newUserPresenter);
}

class UserSetList extends UserState {
  final PaginatorUserModel? newPaginatorUserModel;
  const UserSetList(this.newPaginatorUserModel)
      : super(paginatorUserModel: newPaginatorUserModel);
}
