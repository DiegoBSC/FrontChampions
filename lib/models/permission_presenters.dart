// To parse this JSON data, do
//
//     final permissionPresenters = permissionPresentersFromJson(jsonString);

import 'dart:convert';

PermissionPresenters permissionPresentersFromJson(String str) =>
    PermissionPresenters.fromJson(json.decode(str));

String permissionPresentersToJson(PermissionPresenters data) =>
    json.encode(data.toJson());

class PermissionPresenters {
  PermissionPresenters({
    this.id = "",
    this.name = "",
    this.status = "",
  });

  String id;
  String name;
  String status;

  factory PermissionPresenters.fromJson(Map<String, dynamic> json) =>
      PermissionPresenters(
        id: json["id"],
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['status'] = status;
    return _data;
  }
}
