import 'dart:convert';

import 'package:flutter_news_app/api/news/dto/news_response.dart';
import 'package:flutter_news_app/api/news/dto/user_response.dart';
import 'package:http/http.dart' as http;

Future<UserResponse> fetchUserById(int id) async {
  final responseUser = await http.get(Uri.parse('$host/users/$id'));
  if (responseUser.statusCode == 200) {
    return UserResponse.fromJson(json.decode(responseUser.body));
  } else {
    throw Exception('Failed to load data');
  }
}
