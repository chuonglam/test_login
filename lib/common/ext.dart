extension StringX on String {
  bool get isValidEmail =>
      RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(trim());

  bool get isValidPassword => length >= 6;
}
