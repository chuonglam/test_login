import 'package:data/data.dart';
import 'package:data/src/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'User',
    () {
      test(
        'fromModel works correctly',
        () {
          final UserModel model = UserModel(username: 'name1');
          expect(
              User.fromModel(model),
              isA<User>()
                  .having((user) => user.username, 'username field', 'name1'));
        },
      );
    },
  );
}
