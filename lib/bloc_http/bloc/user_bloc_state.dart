part of 'user_bloc_bloc.dart';

enum UsersStatus { initial, loading, success, failure }

class UserBlocState extends Equatable {
  const UserBlocState({required this.status, required this.users});

  factory UserBlocState.initial() => const UserBlocState(
        status: UsersStatus.initial,
        users: [],
      );

  final UsersStatus status;
  final List<User> users;

  @override
  List<Object> get props => [status, users];

  UserBlocState copyWith({UsersStatus? status, List<User>? users}) {
    return UserBlocState(
      status: status ?? this.status,
      users: users ?? this.users,
    );
  }
}
