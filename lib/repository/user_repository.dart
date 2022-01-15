import 'package:sport_system_play/models/paginator_user_model.dart';
import 'package:sport_system_play/services/user_service.dart';

class UserRepository {
  UserService userService = UserService();
  final int page;
  final int size;
  final String idCompany;

  UserRepository(
      {required this.page, required this.size, required this.idCompany});

  Future<PaginatorUserModel?> getUsersByCompany() async =>
      await userService.getUserByCompany(page, size, idCompany);
}
