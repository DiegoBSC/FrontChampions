import 'dart:convert';

import 'package:sport_system_play/models/user_presenter.dart';

PaginatorUserModel paginatorUserModelFromJson(String str) =>
    PaginatorUserModel.fromJson(json.decode(str));

String paginatorUserModelToJson(PaginatorUserModel data) =>
    json.encode(data.toJson());

class PaginatorUserModel {
  int? totalPages;
  int? totalElements;
  List<UserPresenter>? data;

  PaginatorUserModel({this.totalPages, this.totalElements, this.data});

  PaginatorUserModel.fromJson(Map<String, dynamic> json) {
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    if (json['data'] != null) {
      data = <UserPresenter>[];
      json['data'].forEach((v) {
        data!.add(UserPresenter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['totalPages'] = totalPages;
    data['totalElements'] = totalElements;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
