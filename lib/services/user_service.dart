import 'dart:convert';

import 'package:sport_system_play_mono/global/enviroments.dart';
import 'package:sport_system_play_mono/models/paginator_user_model.dart';

import 'package:http/http.dart' as http;
import 'package:sport_system_play_mono/models/user_presenter.dart';
import 'package:sport_system_play_mono/services/auth_service.dart';

class UserService {
  PaginatorUserModel? paginatorUserModel;
  bool _loading = false;

  // ignore: unnecessary_getters_setters
  bool get loading => _loading;

  // ignore: unnecessary_getters_setters
  set loading(bool loading) {
    _loading = loading;
  }

  Future<PaginatorUserModel?> getUserByAdmin(int page, int size) async {
    loading = true;
    final String token = await AuthService.getToken();

    final resp = await http.get(
        Uri.parse(
            '${Enviroments.apiUrl}/private/user/getUsers?page=$page&size=$size'),
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

  Future<UserPresenter?> saveUser(UserPresenter userSave) async {
    try {
      loading = true;
      final data = jsonEncode(userSave.toJson());
      final resp = await http.post(Uri.parse('${Enviroments.apiUrl}/user/save'),
          body: data, headers: {'Content-Type': 'application/json'});
      if (resp.statusCode == 200 && resp.body.isNotEmpty) {
        loading = false;
        return userPresenterFromJson(resp.body);
      }
    } catch (_) {
      loading = false;
      return null;
    }
  }
}
