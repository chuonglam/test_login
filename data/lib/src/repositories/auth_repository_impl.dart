import 'dart:io';

import 'package:data/data.dart';
import 'package:data/src/models/user_model.dart';
import 'package:data/src/responses/api_response.dart';
import 'package:data/src/services/auth_service.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  AuthRepositoryImpl({
    required AuthService authService,
  }) : _authService = authService;

  @override
  Future<AppResult<User>> login(String email, String password) async {
    try {
      final ApiResponse<UserModel> response =
          await _authService.login(email, password);
      if (response.statusCode == 200 && response.data != null) {
        return AppResult.success(User.fromModel(response.data!));
      }
      if (response.statusCode == 401) {
        return AppResult.error(InvalidLoginCredentials());
      }
      return AppResult.error(
          DefaultError(message: '${response.statusCode} error'));
    } on SocketException catch (_) {
      return AppResult.error(NoInternetConnectionError());
    } catch (e) {
      return AppResult.error(DefaultError());
    }
  }
}
