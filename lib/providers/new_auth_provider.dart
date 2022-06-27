import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:brk_mobile/models/user.dart';
import 'package:brk_mobile/networks/app_url.dart';
import 'package:brk_mobile/preferences/userPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status {
  notLoggedIn,
  notRegistered,
  loggedIn,
  registered,
  authenticating,
  registering,
  loggedOut
}

class NewAuthProvider with ChangeNotifier {
  Status _loggedInStatus = Status.notLoggedIn;
  Status _registeredInStatus = Status.notRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;
    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
    };

    _loggedInStatus = Status.authenticating;
    notifyListeners();

    Response response = await post(
      Uri.parse(AppUrl.login),
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['data'];
      print(userData);
      print(userData['access_token']);
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setBool('isLogin', true);
      localStorage.setString('isUserToken', userData['access_token']);

      User authUser = User.fromJson(userData['user']);
      authUser.token = userData['access_token'];

      UserPreferences().saveUser(authUser);
      notifyListeners();

      _loggedInStatus = Status.loggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successfull', 'user': authUser};
    } else {
      _loggedInStatus = Status.notLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> register(
      String name, String username, String email, String password) async {
    var result;
    final Map<String, dynamic> registrationData = {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    };

    _registeredInStatus = Status.registering;
    notifyListeners();

    _loggedInStatus = Status.authenticating;
    notifyListeners();

    Response response = await post(
      Uri.parse(AppUrl.register),
      body: json.encode(registrationData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['data'];
      print(userData);
      print(userData['access_token']);
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setBool('isLogin', true);
      localStorage.setString('isUserToken', userData['access_token']);

      User authUser = User.fromJson(userData['user']);
      authUser.token = userData['access_token'];

      UserPreferences().saveUser(authUser);
      notifyListeners();

      _loggedInStatus = Status.loggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successfull', 'user': authUser};
    } else {
      _loggedInStatus = Status.notLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  static Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      var userData = responseData['data'];

      User authUser = User.fromJson(userData['user']);
      authUser.token = userData['access_token'];

      UserPreferences().saveUser(authUser);
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }

    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }

  logout(tokenUser) async {
    var url = Uri.parse(AppUrl.logout);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + tokenUser
    };

    return await post(url, headers: headers);
  }
}
