import 'package:sport_system_play_mono/models/paginator_user_model.dart';
import 'package:sport_system_play_mono/services/user_service.dart';

class UserRepository {
  UserService userService = UserService();
  final int page;
  final int size;

  UserRepository({required this.page, required this.size});

  Future<PaginatorUserModel?> getUsersByAdmin() async =>
      await userService.getUserByAdmin(page, size);
}
