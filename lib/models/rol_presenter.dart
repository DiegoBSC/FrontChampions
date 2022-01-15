// To parse this JSON data, do
//
//     final rolPresenter = rolPresenterFromJson(jsonString);

import 'dart:convert';

import 'package:sport_system_play/models/permission_presenters.dart';

RolPresenter rolPresenterFromJson(String str) =>
    RolPresenter.fromJson(json.decode(str));

String rolPresenterToJson(RolPresenter data) => json.encode(data.toJson());

class RolPresenter {
  RolPresenter({
    this.id = "",
    this.name = "",
    this.status = "",
    required this.permissionsPresenters,
  });

  String id;
  String name;
  String status;
  List<PermissionPresenters> permissionsPresenters;

  factory RolPresenter.fromJson(Map<String, dynamic> json) => RolPresenter(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        permissionsPresenters: List<PermissionPresenters>.from(
            json["permissionsPresenters"]
                .map((x) => PermissionPresenters.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "permissionsPresenters": permissionsPresenters =
            List<PermissionPresenters>.from(
                permissionsPresenters.map((x) => x.toJson())),
      };
}
