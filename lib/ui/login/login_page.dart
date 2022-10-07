import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login/sl/sl.dart';
import 'package:test_login/ui/login/login_vm.dart';
import 'package:test_login/ui/login/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginVM _loginVM = sl<LoginVM>();

  @override
  void initState() {
    super.initState();
    _loginVM.addListener(_showDialog);
  }

  void _showDialog() {
    if (_loginVM.data.message.isEmpty) {
      return;
    }
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          content: Text('"${_loginVM.data.message}"'),
        );
      },
    );
  }

  @override
  void dispose() {
    _loginVM.removeListener(_showDialog);
    _loginVM.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Demo"),
      ),
      body: ChangeNotifierProvider.value(
        value: _loginVM,
        child: LoginForm(),
      ),
    );
  }
}
