import 'package:sport_system_play/global/enviroments.dart';
import 'package:sport_system_play/models/paginator_user_model.dart';

import 'package:http/http.dart' as http;
import 'package:sport_system_play/services/auth_service.dart';

class UserService {
  PaginatorUserModel? paginatorUserModel;
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
  }

  Future<PaginatorUserModel?> getUserByCompany(
      int page, int size, String idCompany) async {
    loading = true;
    final String token = await AuthService.getToken();

    final resp = await http.get(
        Uri.parse(
            '${Enviroments.apiUrl}/private/user/getUserByCompany?idCompany=$idCompany&page=$page&size=$size'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token '
        });

    if (resp.statusCode == 200 && resp.body.isNotEmpty) {
      loading = false;
      return paginatorUserModelFromJson(resp.body);
    }

    loading = false;
    return null;
  }
}
