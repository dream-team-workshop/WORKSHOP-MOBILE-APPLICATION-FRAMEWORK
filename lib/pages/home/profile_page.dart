import 'dart:convert';

import 'package:brk_mobile/models/user_model.dart';
import 'package:brk_mobile/networks/api.dart';
import 'package:brk_mobile/pages/login_page.dart';
import 'package:brk_mobile/providers/auth_provider.dart';
import 'package:brk_mobile/services/auth_service.dart';
import 'package:brk_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // UserModel user = authProvider.user;

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
                      // 'Hallo, ${user.name}',
                      'Hallo',
                      style: primaryTextStyle.copyWith(
                        fontSize: 20.0,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      // '@${user.username}',
                      '@username',
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
                    SharedPreferences localStorage =
                        await SharedPreferences.getInstance();
                    await localStorage.clear();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
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
                'Account',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/edit-profile',
                  );
                },
                child: menuItem(
                  'Edit Profile',
                ),
              ),
              menuItem(
                'Your Orders',
              ),
              menuItem(
                'Help',
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'General',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              menuItem(
                'Privacy & Policy',
              ),
              menuItem(
                'Term of Service',
              ),
              menuItem(
                'Rate App',
              ),
              menuItem(
                'About',
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
