import 'package:data/data.dart';
import 'package:data/src/models/user_model.dart';
import 'package:data/src/responses/api_response.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AuthService {
  Future<ApiResponse<UserModel>> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw InvalidLoginCredentials();
    }
    await Future.delayed(const Duration(seconds: 2));
    if (email == 'hello@example.com' && password == '123456') {
      return ApiResponse<UserModel>(
        statusCode: 200,
        data: UserModel(username: 'hello_example'),
        message: 'Success',
      );
    }
    return ApiResponse<UserModel>(
      statusCode: 401,
      message: 'Unauthorized',
    );
  }
}
