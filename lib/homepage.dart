import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interface_abstract_flutter_demo/listwidget.dart';
import 'bloc_http/bloc/user_bloc_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  late var userBloc;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              widget.userBloc = BlocProvider.of<UserBlocBloc>(context);
              widget.userBloc.add(GetUserList()); // Dispatch the event
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ListviewWidget(userBloc: widget.userBloc),
                  ));
            },
            child: const Text('HIT API')),
      ),
    );
  }
}
