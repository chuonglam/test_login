import 'package:flutter_test/flutter_test.dart';
import 'package:test_login/ui/common/ext.dart';

void main() {
  group(
    'StringX',
    () {
      group(
        'isValidPassword func',
        () {
          test(
            'returns true when password length is >= 6',
            () {
              String password = '123456';
              expect(password.isValidPassword, true);
            },
          );

          test(
            'returns true when password length is >= 6 and contains spaces',
            () {
              String password = '12345 ';
              expect(password.isValidPassword, true);
            },
          );

          test(
            'returns false when password length is < 6',
            () {
              String password = '12345';
              expect(password.isValidPassword, false);
            },
          );
        },
      );

      group(
        'isValidEmail func',
        () {
          test(
            'returns true when email is valid',
            () {
              String email = 'chuonglam@gmail.com';
              expect(email.isValidEmail, true);
            },
          );

          test(
            'returns false when email contains white space',
            () {
              String email = 'chuong lam@gmail.com';
              expect(email.isValidEmail, false);
            },
          );

          test(
            'returns false when email has invalid domain',
            () {
              String email = 'chuong@gmail';
              expect(email.isValidEmail, false);
            },
          );

          test(
            'returns false when email has no @',
            () {
              String email = 'chuonggmail.com';
              expect(email.isValidEmail, false);
            },
          );

          test(
            'returns false when email is empty',
            () {
              String email = '';
              expect(email.isValidEmail, false);
            },
          );
        },
      );
    },
  );
}
