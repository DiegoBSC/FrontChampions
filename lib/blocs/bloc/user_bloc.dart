import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sport_system_play/models/paginator_user_model.dart';
import 'package:sport_system_play/models/user_presenter.dart';
import 'package:sport_system_play/repository/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<SelectUserEvent>((event, emit) {
      emit(UserSet(event.userPresenter));
    });

    on<UserListEvent>((event, emit) async {
      UserRepository repository = UserRepository(
          page: event.page, size: event.size, idCompany: event.customerId);
      PaginatorUserModel? paginator = await repository.getUsersByCompany();
      emit(UserSetList(paginator));
    });
  }
}
