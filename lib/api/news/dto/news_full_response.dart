import 'package:flutter_news_app/api/news/dto/news_response.dart';
import 'package:flutter_news_app/api/news/dto/user_response.dart';

const host = 'https://jsonplaceholder.typicode.com';

class NewsFullResponse {
  final NewsResponse newsResponse;
  final UserResponse userResponse;

  NewsFullResponse({required this.newsResponse, required this.userResponse});
}
