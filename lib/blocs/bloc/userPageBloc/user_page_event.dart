part of 'user_page_bloc.dart';

@immutable
abstract class UserPageEvent {}

class SelectUserEvent extends UserPageEvent {
  final UserPresenter userPresenter;
  SelectUserEvent(this.userPresenter);
}

class UserListEvent extends UserPageEvent {
  final int page;
  final int size;
  UserListEvent(this.page, this.size);
}

class UserScreenEvent extends UserPageEvent {
  final String statePage;
  UserScreenEvent(this.statePage);
}
