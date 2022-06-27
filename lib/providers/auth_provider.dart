import 'package:brk_mobile/networks/api.dart';
import 'package:brk_mobile/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:brk_mobile/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  String baseUrl = 'http://coffeein.sixeyes-tech.com/api';

  late UserModel _user;
  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _user = user;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({String? email, String? password}) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      // await localStorage.setString('token', user.token!);

      print('Token User : ' + user.token!);
      _user = user;
      await localStorage.setBool('isLogin', true);
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Future<bool> logout({String? token}) async {
  //   try {
  //     UserModel user = await AuthService().logout(token: user.token!);
  //     SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     // await localStorage.setString('token', user.token!);

  //     print('Token User : ' + user.token!);
  //     _user = user;
  //     await localStorage.setBool('isLogin', true);
  //     notifyListeners();
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }
}
