// To parse this JSON data, do
//
//     final userPresenter = userPresenterFromJson(jsonString);

import 'dart:convert';

import 'package:sport_system_play/models/rol_presenter.dart';

UserPresenter userPresenterFromJson(String str) =>
    UserPresenter.fromJson(json.decode(str));

String userPresenterToJson(UserPresenter data) => json.encode(data.toJson());

class UserPresenter {
  UserPresenter({
    required this.id,
    required this.username,
    required this.email,
    this.password = "",
    required this.status,
    required this.rolesPresenter,
    required this.idCompany,
  });

  String id;
  String username;
  String email;
  String password;
  String status;
  List<RolPresenter> rolesPresenter;
  String idCompany;

  factory UserPresenter.fromJson(Map<String, dynamic> json) => UserPresenter(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        status: json["status"],
        rolesPresenter: List<RolPresenter>.from(
            json["rolesPresenter"].map((x) => RolPresenter.fromJson(x))),
        idCompany: json["idCompany"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "status": status,
        "rolesPresenter":
            List<RolPresenter>.from(rolesPresenter.map((x) => x.toJson())),
        "idCompany": idCompany,
      };
}
