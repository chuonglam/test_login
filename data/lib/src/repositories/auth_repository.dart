import 'package:data/data.dart';

abstract class AuthRepository {
  Future<AppResult<User>> login(String email, String password);
}
