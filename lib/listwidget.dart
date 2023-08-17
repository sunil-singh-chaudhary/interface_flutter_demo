import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_http/bloc/user_bloc_bloc.dart';

class ListviewWidget extends StatefulWidget {
  final UserBlocBloc userBloc;

  const ListviewWidget({super.key, required this.userBloc});

  @override
  State<ListviewWidget> createState() => _ListviewWidgetState();
}

class _ListviewWidgetState extends State<ListviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider.value(
        value: widget.userBloc,
        child: BlocBuilder<UserBlocBloc, UserBlocState>(
          builder: (context, state) {
            if (state.status == UsersStatus.initial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == UsersStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == UsersStatus.success) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.users[index].name),
                  );
                },
              );
            } else if (state.status == UsersStatus.failure) {
              return const Center(
                child: Text('Failed to get users.'),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
