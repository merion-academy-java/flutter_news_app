const host = 'https://jsonplaceholder.typicode.com';

class NewsResponse {
  final int userId;
  final int id;
  final String title;
  final String body;

  NewsResponse(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
        'body': String body
      } =>
        NewsResponse(userId: userId, id: id, title: title, body: body),
      _ => throw const FormatException('Failed to load news'),
    };
  }
}
