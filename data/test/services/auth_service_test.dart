import 'package:data/data.dart';
import 'package:data/src/models/user_model.dart';
import 'package:data/src/responses/api_response.dart';
import 'package:data/src/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../constants.dart';

void main() {
  group(
    'AuthService',
    () {
      late AuthService authService;
      setUp(() {
        authService = AuthService();
      });

      group(
        'login',
        () {
          test(
            'success when credentials are valid',
            () async {
              final res = await authService.login(
                  TestConstants.email, TestConstants.password);
              expect(
                  res,
                  isA<ApiResponse<UserModel>>()
                      .having((res) => res.data,
                          'data field should be not null', isNotNull)
                      .having((res) => res.statusCode,
                          'statusCode field should be 200', 200));
            },
          );

          test(
            'fails when credentials are not correct',
            () async {
              const String email = 'hello@example.com1';
              const String password = '123456';
              final res = await authService.login(email, password);
              expect(
                  res,
                  isA<ApiResponse<UserModel>>()
                      .having(
                          (res) => res.data, 'data field should null', isNull)
                      .having((res) => res.statusCode,
                          'statusCode field should be 401', 401));
            },
          );

          test(
            'fails when credentials are empty',
            () async {
              expect(() => authService.login('', ''),
                  throwsA(isA<InvalidLoginCredentials>()));
            },
          );
        },
      );
    },
  );
}
