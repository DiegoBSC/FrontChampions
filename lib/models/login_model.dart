// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

import 'package:sport_system_play/models/user_presenter.dart';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.token,
    required this.userPresenter,
  });

  String token;
  UserPresenter userPresenter;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        userPresenter: UserPresenter.fromJson(json["userPresenter"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "userPresenter": userPresenter.toJson(),
      };
}
