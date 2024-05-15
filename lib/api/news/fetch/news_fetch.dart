import 'dart:convert';

import 'package:flutter_news_app/api/news/dto/news_full_response.dart';
import 'package:flutter_news_app/api/news/dto/news_response.dart';
import 'package:flutter_news_app/api/news/dto/user_response.dart';
import 'package:flutter_news_app/api/news/fetch/user_by_id_fetch.dart';
import 'package:http/http.dart' as http;

const host = 'https://jsonplaceholder.typicode.com';

Future<List<NewsResponse>> fetchNews() async {
  final responseNews = await http.get(Uri.parse('$host/posts'));
  if (responseNews.statusCode == 200) {
    List<dynamic> list = json.decode(responseNews.body);
    return list.map((e) => NewsResponse.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<NewsFullResponse>> fetchFullNews() async {
  List<NewsResponse> news = await fetchNews();
  List<NewsFullResponse> newsFullResponse = [];
  for (NewsResponse newsItem in news) {
    UserResponse userResponse = await fetchUserById(newsItem.userId);
    newsFullResponse.add(
        NewsFullResponse(newsResponse: newsItem, userResponse: userResponse));
  }
  return newsFullResponse;
}

Future<NewsFullResponse> fetchFullNewsById(int id) async {
  final responseNews = await http.get(Uri.parse('$host/posts/$id'));
  late NewsResponse newsResponse;
  if (responseNews.statusCode == 200) {
    newsResponse = NewsResponse.fromJson(json.decode(responseNews.body));
  } else {
    throw Exception('Failed to load data');
  }
  UserResponse userResponse = await fetchUserById(newsResponse.userId);
  return NewsFullResponse(
      newsResponse: newsResponse, userResponse: userResponse);
}
