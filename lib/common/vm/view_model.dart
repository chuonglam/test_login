import 'package:flutter/material.dart';

abstract class ViewModel<T> with ChangeNotifier {
  ViewModel(T initial) : _dataNotifier = ValueNotifier(initial);
  final ValueNotifier<T> _dataNotifier;

  T get data => _dataNotifier.value;

  set data(T value) => _dataNotifier.value = value;

  @override
  void addListener(VoidCallback listener) {
    _dataNotifier.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _dataNotifier.removeListener(listener);
  }

  @override
  void dispose() {
    _dataNotifier.dispose();
    super.dispose();
  }
}
