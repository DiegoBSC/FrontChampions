import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sport_system_play_mono/blocs/bloc/userPageBloc/user_bloc_model.dart';
import 'package:sport_system_play_mono/constants.dart';
import 'package:sport_system_play_mono/models/paginator_user_model.dart';
import 'package:sport_system_play_mono/models/user_presenter.dart';
import 'package:sport_system_play_mono/repository/user_repository.dart';

part 'user_page_event.dart';
part 'user_spage_state.dart';

class UserPageBloc extends Bloc<UserPageEvent, UserPageState> {
  UserPageBloc() : super(UserInitial()) {
    on<UserListEvent>((event, emit) async {
      UserRepository repository =
          UserRepository(page: event.page, size: event.size);
      PaginatorUserModel? paginator = await repository.getUsersByAdmin();
      emit(UserSet(
          state.userBlocModel!.copyWith(paginatorUserModel: paginator)));
    });

    on<UserScreenEvent>((event, emit) {
      emit(UserSet(state.userBlocModel!.copyWith(statePage: event.statePage)));
    });
  }
}
