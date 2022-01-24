import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'team_page_bloc_event.dart';
part 'team_page_bloc_state.dart';

class TeamPageBlocBloc extends Bloc<TeamPageBlocEvent, TeamPageBlocState> {
  TeamPageBlocBloc() : super(TeamPageBlocInitial()) {
    on<TeamPageBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
