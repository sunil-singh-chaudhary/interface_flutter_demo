import 'package:flutter/material.dart';

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
                var list = await userRepository.getUser();
                debugPrint('list get is - $list');
              },
              child: const Text('Get API')),
        ),
      ),
    );
  }
}
