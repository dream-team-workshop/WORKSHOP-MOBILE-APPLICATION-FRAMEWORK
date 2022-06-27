import 'dart:convert';
import 'package:brk_mobile/providers/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'package:brk_mobile/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseUrl = 'http://coffeein.sixeyes-tech.com/api';

  var token;

  getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token')!)['token'];
  }

  Future<UserModel> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'apllication/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
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
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
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
    var url = '$baseUrl/login';
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
      user.token = 'Bearer' + data['access_token'];
      return user;
    } else {
      throw Exception('Gagal Login!');
    }
  }

  logout(String token) async {
    var apiURL = '/logout';
    var full = baseUrl + apiURL;
    var url = Uri.parse(full);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token
    };
    var response = await http.post(url, headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
  }

  Future<UserModel> getDataUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token1 = localStorage.getString('token')!;
    int long = token1.length;
    int max = long - 1;
    var subToken = token1.substring(1, max);
    var apiURL = '/user';
    var full = baseUrl + apiURL;
    var url = Uri.parse(full);
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + subToken
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('failed to load user');
    }
  }

  Future<UserModel> getDataUserNow() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;

    String myUrl = "$baseUrl/user";
    http.Response response = await http.get(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $value'
    });
    print(response.body);
    return json.decode(response.body);
    // return UserModel.fromJson(jsonDecode(response.body)['data']);
  }
}
