part of 'user_bloc_bloc.dart';

sealed class UserBlocEvent extends Equatable {
  const UserBlocEvent();
}

class GetUserList extends UserBlocEvent {
  @override
  List<Object> get props => [];
}
