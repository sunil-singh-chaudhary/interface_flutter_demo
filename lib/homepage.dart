import 'package:flutter/material.dart';
import 'package:interface_abstract_flutter_demo/abstractdemo/abstractfirstExample.dart';
import 'package:interface_abstract_flutter_demo/abstractdemo/api.dart';
import 'package:interface_abstract_flutter_demo/abstractdemo/database.dart';
import 'package:interface_abstract_flutter_demo/abstractdemo/manager.dart';

import 'network_support/user_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String baseUrl = 'jsonplaceholder.typicode.com'; // Set your base URL

  final userRepository = UserRepository(url: "jsonplaceholder.typicode.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        child: Center(
          child: ElevatedButton(
              onPressed: () async {
                //simple abstract demo
                var list = await userRepository.getUser();
                debugPrint('list get is - $list');

                //abstract demo in flutter for databse
                AbStractDemo dbdemo = DatabaseProvider();
                DataManaager manager = DataManaager(dbdemo);
                manager.displayData();

                //abstract for api
                AbStractDemo apidemo = ApiProvider();
                DataManaager manager1 = DataManaager(apidemo);
                manager1.displayData();
              },
              child: const Text('Get API')),
        ),
      ),
    );
  }
}
