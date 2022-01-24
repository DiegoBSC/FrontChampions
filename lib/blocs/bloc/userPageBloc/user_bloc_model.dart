import 'package:sport_system_play_mono/models/paginator_user_model.dart';
import 'package:sport_system_play_mono/models/user_presenter.dart';

class UserBlocModel {
  UserPresenter? userSelect;
  PaginatorUserModel? paginatorUserModel;
  String? statePage;

  UserBlocModel({this.userSelect, this.paginatorUserModel, this.statePage});

  copyWith({
    UserPresenter? userSelect,
    PaginatorUserModel? paginatorUserModel,
    String? statePage,
  }) =>
      UserBlocModel(
          userSelect: userSelect ?? this.userSelect,
          paginatorUserModel: paginatorUserModel ?? this.paginatorUserModel,
          statePage: statePage ?? this.statePage);
}
