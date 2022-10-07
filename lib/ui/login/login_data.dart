class LoginData {
  String email;
  String password;
  bool loading;
  String message;

  LoginData({
    this.email = '',
    this.password = '',
    this.loading = false,
    this.message = '',
  });

  LoginData copyWith({
    String? email,
    String? password,
    bool? loading,
    String? message,
  }) {
    return LoginData(
      email: email ?? this.email,
      password: password ?? this.password,
      loading: loading ?? this.loading,
      message: message ?? this.message,
    );
  }
}
