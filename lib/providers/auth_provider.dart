import 'package:flutter/material.dart';
import 'package:craftshop_indonesia/models/user_model.dart';
import 'package:craftshop_indonesia/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user;
  //bool isAuthorized = false;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String name,
    String username,
    String email,
    String password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _user = user;
      // this.isAuthorized = true;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String email,
    String password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );
      _user = user;
      // this.isAuthorized = true;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
