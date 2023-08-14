import 'dart:io';

import 'package:interface_abstract_flutter_demo/network_support/baserepository.dart';
import 'package:http/http.dart' show Client;

import '../models/userModel.dart';

class UserRepository extends BaseRepository {
  Client? client;
  String url;

  UserRepository({this.client, required this.url}) : super(client, url);

  Future<List<User>> getUser() async {
    final response = await get<List>('/users').catchError((error) {
      if (error is HttpException) {
        throw error;
      } else {
        throw Exception();
      }
    });
    return response.map((e) => User.fromJson(e)).toList();
  }

  Future<User> getUserID(int id) async {
    final response =
        await get<Map<String, dynamic>>('/user/$id').catchError((error) {
      if (error is HttpException) {
        throw error;
      } else {
        throw Exception();
      }
    });
    return User.fromJson(response);
  }
}
