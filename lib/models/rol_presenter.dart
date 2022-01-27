// To parse this JSON data, do
//
//     final rolPresenter = rolPresenterFromJson(jsonString);

import 'dart:convert';

import 'package:sport_system_play_mono/models/permission_presenters.dart';

RolPresenter rolPresenterFromJson(String str) =>
    RolPresenter.fromJson(json.decode(str));

String rolPresenterToJson(RolPresenter data) => json.encode(data.toJson());

class RolPresenter {
  RolPresenter({
    this.id = "",
    this.name = "",
    this.status = "",
    this.permissionsPresenters,
  });

  String id;
  String name;
  String status;
  List<PermissionPresenters>? permissionsPresenters;

  factory RolPresenter.fromJson(Map<String, dynamic> json) => RolPresenter(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        permissionsPresenters: List<PermissionPresenters>.from(
            json["permissionsPresenters"]
                .map((x) => PermissionPresenters.fromJson(x))),
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    if (id.isNotEmpty) {
      _data['id'] = id;
    }
    _data['name'] = name;
    if (status.isNotEmpty) {
      _data['status'] = status;
    }
    if (permissionsPresenters != null) {
      _data['permissionsPresenters'] =
          permissionsPresenters!.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}
