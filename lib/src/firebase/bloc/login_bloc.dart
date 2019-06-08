import 'package:flutter/material.dart';

class LoginBloc extends ChangeNotifier {
  String _username;
  String _password;

  String get username => _username;
  String get password => _password;

  set setusername(String value) {
    _username = value;
    notifyListeners();
  }

  set setpassword(String value) {
    _password = value;
    notifyListeners();
  }

  enterUsername(String username) {
    setusername = username;
  }

  enterPassword(String password) {
    setpassword = password;
  }
}
