class UserResponse {
  // {
  //     "id": 1,
  //     "name": "Leanne Graham",
  //     "username": "Bret",
  //     "email": "Sincere@april.biz",
  //     "address": {
  //       "street": "Kulas Light",
  //       "suite": "Apt. 556",
  //       "city": "Gwenborough",
  //       "zipcode": "92998-3874",
  //       "geo": {
  //         "lat": "-37.3159",
  //         "lng": "81.1496"
  //       }
  //     },
  //     "phone": "1-770-736-8031 x56442",
  //     "website": "hildegard.org",
  //     "company": {
  //       "name": "Romaguera-Crona",
  //       "catchPhrase": "Multi-layered client-server neural-net",
  //       "bs": "harness real-time e-markets"
  //     }

  final int id;
  final String name;
  final String username;
  final String email;

  UserResponse(
      {required this.id,
      required this.name,
      required this.username,
      required this.email});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'username': String username,
        'email': String email
      } =>
        UserResponse(id: id, name: name, username: username, email: email),
      _ => throw const FormatException('Failed to load user'),
    };
  }
}
