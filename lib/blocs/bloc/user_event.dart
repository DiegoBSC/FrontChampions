part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class SelectUserEvent extends UserEvent {
  final UserPresenter userPresenter;
  SelectUserEvent(this.userPresenter);
}

class UserListEvent extends UserEvent {
  final int page;
  final int size;
  final String customerId;
  UserListEvent(this.page, this.size, this.customerId);
}
