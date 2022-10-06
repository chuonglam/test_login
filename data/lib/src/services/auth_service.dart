import 'package:data/src/models/user_model.dart';
import 'package:data/src/responses/api_response.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AuthService {
  Future<ApiResponse<UserModel>> login(String email, String password) async {
    if (email == 'hello@example.com' && password == '123456') {
      return ApiResponse(
        statusCode: 200,
        data: UserModel(username: 'hello_example'),
        message: 'Success',
      );
    }
    return ApiResponse(
      statusCode: 401,
      message: 'Unauthorized',
    );
  }
}
