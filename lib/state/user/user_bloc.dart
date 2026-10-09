import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sketch/core/api_service.dart';
import 'package:sketch/core/model/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiService apiService;
  UserBloc({required this.apiService}) : super(UserState()) {
    on<UsersFetched>((event, emit) async {
      emit(state.copyWith(status: UserStatus.loading));
      try {
        final users = await apiService.fetchUsers();
        emit(state.copyWith(status: UserStatus.success, users: users));
      } catch (e) {
        emit(
          state.copyWith(
            status: UserStatus.failure,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}
