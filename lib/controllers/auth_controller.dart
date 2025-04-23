import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  final username = "aryadamar";
  final password = "123456";

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username tidak boleh kosong';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  bool login(String inputUsername, String inputPassword) {
    return inputUsername == username && inputPassword == password;
  }
}
