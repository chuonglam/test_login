import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:test_login/common/ext.dart';
import 'package:test_login/common/vm/view_model.dart';
import 'package:test_login/ui/login/login_data.dart';

@Injectable()
class LoginVM extends ViewModel<LoginData> {
  final AuthRepository _authRepository;
  LoginVM({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginData());

  String? validateEmail(String? value) {
    if (value?.isValidEmail == true) {
      return null;
    }
    return 'Email must be valid';
  }

  String? validatePassword(String? value) {
    if (value?.isValidPassword == true) {
      return null;
    }
    return 'Password length must be at least 6 characters long';
  }

  void updateInput({String? email, String? password}) {
    data = data.copyWith(email: email, password: password, message: '');
  }

  void login() async {
    data = data.copyWith(
      loading: true,
      message: '',
    );
    final AppResult<User> result =
        await _authRepository.login(data.email, data.password);
    if (result.success) {
      data = data.copyWith(
        loading: false,
        message: 'Login success',
      );
      return;
    }
    data = data.copyWith(
      loading: false,
      message: (result.error ?? DefaultError()).message,
    );
  }
}
