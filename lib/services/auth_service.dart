import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sport_system_play/global/enviroments.dart';
import 'package:sport_system_play/models/login_model.dart';
import 'package:sport_system_play/models/user_presenter.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService with ChangeNotifier {
  UserPresenter? userPresenter;
  bool _loading = false;
  final _storage = FlutterSecureStorage();

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  static Future<String> getToken() async {
    final _storage = FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token ?? "";
  }

  static Future<void> deleteToken() async {
    final _storage = FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<bool> login(String username, String password) async {
    loading = true;

    final data = {"username": username, "password": password};

    final resp = await http.post(Uri.parse('${Enviroments.apiUrlUser}/login'),
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    if (resp.statusCode == 200 && resp.body.isNotEmpty) {
      final loginModel = loginModelFromJson(resp.body);
      userPresenter = loginModel.userPresenter;
      await _saveToken(loginModel.token);
      loading = false;
      return true;
    }

    loading = false;
    return false;
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'token');
    if (token != null) {
      return true;
    }
    _logout();
    return false;
  }

  Future _saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
    return;
  }

  Future _logout() async {
    await _storage.delete(key: 'token');
  }
}
