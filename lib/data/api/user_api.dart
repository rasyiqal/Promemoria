class User {
  final String username;
  final String password;

  const User({
    required this.username,
    required this.password,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['user'],
      password: json['password'],
    );
  }
}
