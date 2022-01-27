import 'package:sport_system_play_mono/models/paginator_user_model.dart';
import 'package:sport_system_play_mono/models/user_presenter.dart';
import 'package:sport_system_play_mono/services/user_service.dart';

class UserRepository {
  UserService userService = UserService();
  final int? page;
  final int? size;
  final UserPresenter? userPresenter;

  UserRepository({this.page, this.size, this.userPresenter});

  Future<PaginatorUserModel?> getUsersByAdmin() async =>
      await userService.getUserByAdmin(page!, size!);

  Future<UserPresenter?> saveUser() async =>
      await userService.saveUser(userPresenter!);
}
