import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../models/user.dart';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('id', user.id!);
    prefs.setString('name', user.name!);
    prefs.setString('email', user.email!);
    prefs.setString('username', user.username!);
    prefs.setString('profilePhotoUrl', user.profilePhotoUrl!);
    prefs.setString('token', user.token!);

    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt('id');
    String name = prefs.getString('name').toString();
    String email = prefs.getString('email').toString();
    String username = prefs.getString('username').toString();
    String profilePhotoUrl = prefs.getString('profilePhotoUrl').toString();
    String token = prefs.getString('token').toString();

    return User(
        id: id,
        name: name,
        email: email,
        username: username,
        profilePhotoUrl: profilePhotoUrl,
        token: token);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('name');
    prefs.remove('email');
    prefs.remove('username');
    prefs.remove('profilePhotoUrl');
    prefs.remove('token');
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    return token;
  }
}
