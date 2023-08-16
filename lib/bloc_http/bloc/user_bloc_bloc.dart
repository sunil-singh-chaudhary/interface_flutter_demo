import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/userModel.dart';
import '../../network_support/user_repository.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserBlocBloc extends Bloc<UserBlocEvent, UserBlocState> {
  UserBlocBloc() : super(UserBlocState.initial()) {
    // on<GetUserList>((event, emit) {   //doing it like this will not worked
    //   fetchUserList(event, emit);
    // });

    on<GetUserList>((event, emit) => fetchUserList(event, emit)); //will worked
  }

  fetchUserList(GetUserList event, Emitter<UserBlocState> emit) async {
    String baseUrl = 'jsonplaceholder.typicode.com'; // Set your base URL

    final userRepository = UserRepository(url: baseUrl);

    emit(state.copyWith(status: UsersStatus.loading));
    try {
      List<User> list = await userRepository.getUser();
      emit(state.copyWith(status: UsersStatus.success, users: list));

      debugPrint('list by bloc $list');
    } catch (e) {
      emit(state.copyWith(status: UsersStatus.failure));
    }
  }
}
