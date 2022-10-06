import 'package:data/src/models/user_model.dart';

class User {
  String username;
  User({required this.username});

  factory User.fromModel(UserModel model) => User(
        username: model.username,
      );
}
