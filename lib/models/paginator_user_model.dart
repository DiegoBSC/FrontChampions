import 'dart:convert';

import 'package:sport_system_play_mono/models/user_presenter.dart';

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
      json['data'].forEach((item) {
        data!.add(UserPresenter.fromJson(item));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalPages'] = totalPages;
    data['totalElements'] = totalElements;
    if (this.data != null) {
      data['data'] = this.data!.map((item) => item.toJson()).toList();
    }
    return data;
  }
}
