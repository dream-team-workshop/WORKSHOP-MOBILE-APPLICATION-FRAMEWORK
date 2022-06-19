import 'dart:convert';
import 'package:brk_mobile/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network with ChangeNotifier {
  final String baseURL = 'http://coffeein.sixeyes-tech.com/api';

  var token;

  getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token')!)['token'];
  }

  auth(data, apiURL) async {
    return await http.post(
      Uri.parse(baseURL + apiURL),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    var url = '$baseURL/login';
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    var response =
        await http.post(Uri.parse(url), headers: _setHeaders(), body: body);
    print(
      response.body,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var _token = data['access_token'];
      localStorage.setString(token, _token);
      return user;
    } else {
      throw Exception('Gagal Login!');
    }
  }

  logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token1 = localStorage.getString('token')!;
    int long = token1.length;
    int max = long - 1;
    var subToken = token1.substring(1, max);
    var apiURL = '/logout';
    var full = baseURL + apiURL;
    var url = Uri.parse(full);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + subToken
    };
    return await http.post(url, headers: headers);
  }
}
