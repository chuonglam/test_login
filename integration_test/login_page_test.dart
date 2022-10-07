import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_login/main.dart';
import 'package:test_login/sl/sl.dart';
import 'package:test_login/ui/login/login_vm.dart';

import 'mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late AuthRepository authRepository;
  late LoginVM loginVM;

  setUp(() {
    authRepository = MockAuthRepository();
    loginVM = LoginVM(authRepository: authRepository);
    sl.registerSingleton<LoginVM>(loginVM);
  });

  tearDown(() {
    sl.unregister<LoginVM>(instance: loginVM);
  });

  group(
    'Login Page',
    () {
      final emailField = find.byKey(const ValueKey("email"));
      final loginButton = find.byKey(const ValueKey('loginButton'));
      final passwordField = find.byKey(const ValueKey("password"));

      testWidgets(
        'Display empty data',
        (WidgetTester tester) async {
          await tester.pumpWidget(const MyApp());

          // Verify that Login page is being displayed.
          expect(find.text("Login Demo"), findsOneWidget);

          // Verify that initial values are empty
          expect(tester.widget<TextFormField>(emailField).initialValue, '');
          expect(tester.widget<TextFormField>(passwordField).initialValue, '');

          // Verify that the login button is enabled
          final button = tester.widget<ElevatedButton>(loginButton);
          expect(button.enabled, true);
        },
      );

      testWidgets(
        'Display email & password validation error message when input is invalid',
        (tester) async {
          await tester.pumpWidget(const MyApp());
          await tester.enterText(emailField, 'hello@example');
          await tester.tap(loginButton);
          await tester.pump();

          // Verify error messages
          expect(find.text("Email must be valid"), findsOneWidget);
          expect(
              find.text("Password length must be at least 6 characters long"),
              findsOneWidget);
        },
      );

      testWidgets(
        'Display Success popup when login success',
        (tester) async {
          // Init mock responses
          final loginResult = MockAppResult();
          when(() => loginResult.success).thenReturn(true);
          when(() => authRepository.login(any(), any()))
              .thenAnswer((invocation) async => loginResult);

          await tester.pumpWidget(const MyApp());

          // Input credentials
          await tester.enterText(emailField, 'hello@example.com');
          await tester.enterText(passwordField, '123456');
          await tester.tap(loginButton);
          await tester.pumpAndSettle(const Duration(seconds: 3));

          // Verify Success message
          expect(find.text("Login success"), findsOneWidget);
        },
      );

      testWidgets(
        'Display error message popup when login fails',
        (tester) async {
          final loginResult = MockAppResult();
          when(() => loginResult.success).thenReturn(false);
          when(() => loginResult.error).thenReturn(InvalidLoginCredentials());
          when(() => authRepository.login(any(), any()))
              .thenAnswer((invocation) async => loginResult);

          await tester.pumpWidget(const MyApp());

          // Input credentials
          await tester.enterText(emailField, 'hi@example.com');
          await tester.enterText(passwordField, '123456');
          await tester.tap(loginButton);
          await tester.pumpAndSettle(const Duration(seconds: 3));

          // Verify the message is displayed
          expect(find.text("Invalid login credentials"), findsOneWidget);
        },
      );
    },
  );
}
