import 'dart:convert';

import 'package:brk_mobile/models/user_model.dart';
import 'package:brk_mobile/networks/api.dart';
import 'package:brk_mobile/pages/edit_profile.dart';
import 'package:brk_mobile/pages/login_page.dart';
import 'package:brk_mobile/providers/auth_provider.dart';
import 'package:brk_mobile/providers/new_auth_provider.dart';
import 'package:brk_mobile/services/auth_service.dart';
import 'package:brk_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../preferences/userPreferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var tokenUser;
  bool _isLoading = false;

  String? nama, username, token;

  void getUserData() {
    UserPreferences().getUser().then((value) {
      print("value: $value");
      nama = value.name!;
      username = value.username!;
      token = value.token!;
      print(nama);
      print(username);
    });
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget buildHeader() {
      return AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
            child: Container(
          padding: EdgeInsets.all(
            25.0,
          ),
          child: Row(
            children: [
              ClipRRect(
                // child: Image.network(user.profilePhotoUrl!),
                child: Image.asset(
                  'assets/images/img_profile.png',
                  width: 60,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo, ${nama}',
                      style: primaryTextStyle.copyWith(
                        fontSize: 20.0,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '@${username}',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Builder(builder: (context) {
                return GestureDetector(
                  onTap: () async {
                    var res = await NewAuthProvider().logout(token);
                    print(res.body);
                    if (res.statusCode == 200) {
                      SharedPreferences localStorage =
                          await SharedPreferences.getInstance();
                      localStorage.setBool('isLogin', false);
                      UserPreferences().removeUser();
                      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                    }
                    // SharedPreferences localStorage =
                    //     await SharedPreferences.getInstance();
                    // await localStorage.clear();
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, '/login', (route) => false);
                  },
                  child: Image.asset(
                    'assets/images/exit_button.png',
                    width: 20,
                  ),
                );
              }),
            ],
          ),
        )),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: subtitleTextStyle.copyWith(
                fontSize: 13.0,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryColor,
            ),
          ],
        ),
      );
    }

    Widget buildContent() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Akun saya',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          EditProfilePage(nama!, username!, username!)));
                },
                child: menuItem(
                  'Edit Profil',
                ),
              ),
              menuItem(
                'Pesanan Saya',
              ),
              menuItem(
                'Bantuan',
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Umum',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              menuItem(
                'Kebijakan & Privasi',
              ),
              menuItem(
                'Ketentuan Layanan',
              ),
              menuItem(
                'Rating Aplikasi',
              ),
              menuItem(
                'Tentang',
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        buildHeader(),
        Divider(
          thickness: 0.3,
          color: accentColor,
        ),
        buildContent(),
      ],
    );
  }
}
