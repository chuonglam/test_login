import 'package:data/src/models/user_model.dart';
import 'package:data/src/responses/api_response.dart';
import 'package:data/src/services/auth_service.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthService extends Mock implements AuthService {}

class MockUserModel extends Mock implements UserModel {}

class MockApiResponseUserModel extends Mock implements ApiResponse<UserModel> {}
