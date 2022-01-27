// To parse this JSON data, do
//
//     final userPresenter = userPresenterFromJson(jsonString);

import 'dart:convert';

import 'package:sport_system_play_mono/models/rol_presenter.dart';

UserPresenter userPresenterFromJson(String str) =>
    UserPresenter.fromJson(json.decode(str));

String userPresenterToJson(UserPresenter data) => json.encode(data.toJson());

class UserPresenter {
  UserPresenter(
      {this.id,
      required this.username,
      required this.email,
      this.password = "",
      this.status,
      required this.rolesPresenter,
      required this.createdDate});

  String? id;
  String username;
  String email;
  String? password;
  String? status;
  List<RolPresenter> rolesPresenter;
  DateTime createdDate;

  factory UserPresenter.fromJson(Map<String, dynamic> json) => UserPresenter(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        status: json["status"],
        rolesPresenter: List<RolPresenter>.from(
            json["rolesPresenter"].map((x) => RolPresenter.fromJson(x))),
        createdDate: DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    _data['email'] = email;
    _data['password'] = password;
    _data['status'] = status;
    _data['rolesPresenter'] = rolesPresenter.map((e) => e.toJson()).toList();
    return _data;
  }
}
