import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_login/common/app_theme.dart';
import 'package:test_login/sl/sl.dart';
import 'package:test_login/ui/login/login_page.dart';

void main() {
  configureDependencies();
  return runZonedGuarded(
    () async {
      runApp(const MyApp());
    },
    (error, stack) {
      //todo: track logs here
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: AppTheme.appTheme(context),
      home: const LoginPage(),
    );
  }
}
