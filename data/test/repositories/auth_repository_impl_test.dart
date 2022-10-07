import 'package:data/data.dart';
import 'package:data/src/repositories/auth_repository_impl.dart';
import 'package:data/src/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../constants.dart';
import 'mocks.dart';

void main() {
  group(
    'AuthRepositoryImpl',
    () {
      late AuthService authService;
      late AuthRepository authRepository;

      setUp(() {
        authService = MockAuthService();
        authRepository = AuthRepositoryImpl(authService: authService);
      });

      group(
        'login',
        () {
          test(
            'success when credentails are valid',
            () async {
              final userModel = MockUserModel();
              final loginResponse = MockApiResponseUserModel();
              when(() => userModel.username).thenReturn('name');
              when(() => loginResponse.statusCode).thenReturn(200);
              when(() => loginResponse.data).thenReturn(userModel);
              when(() => authService.login(any(), any()))
                  .thenAnswer((_) async => loginResponse);
              final AppResult<User> result = await authRepository.login(
                  TestConstants.email, TestConstants.password);
              expect(result.success, true);
            },
          );

          test(
            'fails with InvalidCredentials when credentails are empty',
            () async {
              when(() => authService.login(any(), any()))
                  .thenThrow(InvalidLoginCredentials());

              final result = await authRepository.login('', '');
              expect(
                  result,
                  isA<AppResult<User>>()
                      .having((result) => result.success, 'should true', false)
                      .having(
                          (result) => result.error,
                          'is InvalidLoginCredentials',
                          isA<InvalidLoginCredentials>()));
            },
          );

          test(
            'fails when credentials are not correct',
            () async {
              final userModel = MockUserModel();
              final loginResponse = MockApiResponseUserModel();
              when(() => userModel.username).thenReturn('name');
              when(() => loginResponse.statusCode).thenReturn(401);
              when(() => authService.login(any(), any()))
                  .thenAnswer((_) async => loginResponse);
              final AppResult<User> result = await authRepository.login(
                  TestConstants.email, TestConstants.password);
              expect(
                  result,
                  isA<AppResult<User>>().having(
                      (result) => result.error,
                      'is InvalidLoginCredentials',
                      isA<InvalidLoginCredentials>()));
            },
          );

          test(
            'fails when any exception occurs',
            () async {
              when(() => authService.login(any(), any()))
                  .thenThrow(Exception('error1'));
              final result = await authRepository.login(
                  TestConstants.email, TestConstants.password);
              expect(
                  result,
                  isA<AppResult<User>>().having(
                      (result) => result.error,
                      'is DefaultError()',
                      isA<DefaultError>().having((p0) => p0.message,
                          'is error1', 'Exception: error1')));
            },
          );
        },
      );
    },
  );
}
