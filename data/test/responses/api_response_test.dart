import 'package:data/src/models/user_model.dart';
import 'package:data/src/responses/api_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'ApiResponse',
    () {
      test(
        'fromJson func works correctly',
        () {
          expect(
            ApiResponse<UserModel>.fromJson(
              {
                'statusCode': 200,
                'message': 'success',
                'data': {
                  'username': 'name',
                },
              },
              (jsonData) => UserModel.fromJson(jsonData!),
            ),
            isA<ApiResponse<UserModel>>()
                .having(
                    (response) => response.statusCode, 'status code field', 200)
                .having((res) => res.message, 'message field', 'success')
                .having(
                  (res) => res.data,
                  'data',
                  isNotNull,
                )
                .having((res) => res.data?.username, 'data.username', 'name'),
          );
        },
      );

      test(
        'fromJson func works correctly when data field is null',
        () {
          expect(
            ApiResponse<UserModel>.fromJson(
              {
                'statusCode': 200,
                'message': 'success',
              },
              (jsonData) => UserModel.fromJson(jsonData!),
            ),
            isA<ApiResponse>().having(
              (res) => res.data,
              'data',
              isNull,
            ),
          );
        },
      );

      test(
        'fromJson func works correctly when data field is empty',
        () {
          expect(
            ApiResponse<UserModel>.fromJson(
              {
                'statusCode': 200,
                'message': 'success',
                'data': <String, dynamic>{},
              },
              (jsonData) => UserModel.fromJson(jsonData!),
            ),
            isA<ApiResponse<UserModel>>().having(
              (res) => res.data,
              'data',
              isA<UserModel>().having(
                  (model) => model.username, 'username should empty', ''),
            ),
          );
        },
      );
    },
  );
}
