class UserModel {
  String username;
  UserModel({required this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json['username'],
      );
}
