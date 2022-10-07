import 'package:data/src/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'UserModel',
    () {
      test(
        'fromJson function parses UserModel correctly',
        () {
          const String username = 'name';
          expect(
            UserModel.fromJson({'username': username}),
            isA<UserModel>().having(
                (result) => result.username, 'username field', username),
          );
        },
      );
      test(
        'fromJson function parses UserModel without error when data is empty',
        () {
          expect(
            UserModel.fromJson({}),
            isA<UserModel>()
                .having((result) => result.username, 'username field', ''),
          );
        },
      );
    },
  );
}
