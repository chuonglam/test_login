import 'package:flutter/material.dart';
import 'package:test_login/ui/common/ext.dart';
import 'package:test_login/ui/common/gaps.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (text) {
                    if (text?.isValidEmail == true) {
                      return null;
                    }
                    return 'Email must be valid';
                  },
                ),
                Gaps.vGap16,
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.password),
                  ),
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  validator: (text) {
                    if (text?.isValidPassword == true) {
                      return null;
                    }
                    return 'Password length must be at least 6 characters long';
                  },
                ),
                Gaps.vGap16,
                ElevatedButton(
                  onPressed: _onTapLogin,
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapLogin() {
    if (_formKey.currentState?.validate() == true) {
      //todo: call login
    }
  }
}
