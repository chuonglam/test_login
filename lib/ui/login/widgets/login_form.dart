import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login/common/gaps.dart';
import 'package:test_login/ui/login/login_vm.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final LoginVM viewModel = context.read<LoginVM>();
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
                  key: const ValueKey("email"),
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: viewModel.validateEmail,
                  onSaved: (value) =>
                      viewModel.updateInput(email: value?.trim()),
                ),
                Gaps.vGap16,
                TextFormField(
                  key: const ValueKey("password"),
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.password),
                  ),
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  validator: viewModel.validatePassword,
                  onSaved: (value) => viewModel.updateInput(password: value),
                ),
                Gaps.vGap16,
                Builder(
                  builder: (ctx) {
                    return ElevatedButton(
                      key: const ValueKey("loginButton"),
                      onPressed: () {
                        _onTapLogin(viewModel);
                      },
                      child: ctx.select<LoginVM, bool>((vm) => vm.data.loading)
                          ? const CupertinoActivityIndicator()
                          : const Text("Login"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapLogin(LoginVM viewModel) {
    if (viewModel.data.loading) {
      return;
    }
    if (_formKey.currentState?.validate() == true) {
      _formKey.currentState?.save();
      viewModel.login();
    }
  }
}
