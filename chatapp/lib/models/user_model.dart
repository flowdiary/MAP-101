class UserModel {
  final int id;
  final String username;
  final String token;
  final String? createdAt;

  UserModel({
    required this.id,
    required this.username,
    required this.token,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      username: json['username']?.toString() ?? '',
      token: json['token']?.toString() ?? '',
      createdAt: json['created_at']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'token': token,
      'created_at': createdAt,
    };
  }
}
