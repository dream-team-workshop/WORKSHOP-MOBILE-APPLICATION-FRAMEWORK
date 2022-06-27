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

  getData(apiUrl) async {
    var fullUrl = baseURL + apiUrl;
    await getToken();
    return await http.get(
      Uri.parse(fullUrl),
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
    var headers = _setHeaders();
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var _token = jsonEncode(data['access_token']);
      print(_token);
      print(_token);
      print(_token);
      print(_token);
      var _user = jsonEncode(data['user']);
      localStorage.setString('token', _token);
      localStorage.setString('user', _user);
      return user;
    } else {
      throw Exception('Gagal Login!');
    }
  }

  // Future<UserModel> getDataUser()async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var token1 = token;
  //   int long = token1.length;
  //   int max = long - 1;
  //   var subToken = token1.substring(1,max);
  //   var apiURL = '/user';
  //   var full = baseURL + apiURL;
  //   var url = Uri.parse(full);
  //   Map<String, String> headers = {
  //         'Content-type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer ' + subToken
  //       };
  //     final response = await http.get(url, headers: headers);
  //     if(response.statusCode == 200){
  //       return UserModel.fromJson(jsonDecode(response.body)['data']);
  //     }else{
  //       throw Exception('failed to load user');
  //     }
  // }

  // logout() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var token1 = localStorage.getString('token')!;
  //   int long = token1.length;
  //   int max = long - 1;
  //   var subToken = token1.substring(1, max);
  //   var apiURL = '/logout';
  //   var full = baseURL + apiURL;
  //   var url = Uri.parse(full);
  //   Map<String, String> headers = {
  //     'Content-type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ' + subToken
  //   };
  //   return await http.post(url, headers: headers);
  // }
}
