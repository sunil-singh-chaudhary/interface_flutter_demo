import 'dart:io';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;

abstract class BaseRepository {
  final _client;
  String baseUrl;
  BaseRepository(Client? client, [this.baseUrl = ""])
      : _client = client ?? Client();

  @protected
  Future<T> get<T>(String endpoint) async {
    debugPrint('url is $baseUrl and endpoint is $endpoint');
    final url = Uri.https(baseUrl, endpoint);

    try {
      var response = await _client.get(url);
      if (response.statusCode == HttpStatus.ok) {
        final data = convert.jsonDecode(response.body);
        return data;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }
}
