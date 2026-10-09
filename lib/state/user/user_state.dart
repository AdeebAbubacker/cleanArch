part of 'user_bloc.dart';

enum UserStatus { initial, loading, success, failure }

@immutable
final class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.initial,
    this.users = const <UseModel>[],
    this.errorMessage,
  });

  final UserStatus status;
  final List<UseModel> users;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, users, errorMessage];

  UserState copyWith({
    UserStatus? status,
    List<UseModel>? users,
    String? errorMessage,
  }) {
    return UserState(
      status: status ?? this.status,
      users: users ?? this.users,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
