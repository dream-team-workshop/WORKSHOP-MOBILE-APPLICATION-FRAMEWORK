import 'dart:async';

import 'package:brk_mobile/pages/login_page.dart';
import 'package:brk_mobile/providers/auth_provider.dart';
import 'package:brk_mobile/providers/new_auth_provider.dart';
import 'package:brk_mobile/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:brk_mobile/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool _passwordVisible = false;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  //ON BACK PRESSED
  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
        context: context, builder: (context) => _buildExitDialog(context));
    return exitResult ?? false;
  }

  Future<bool?> _showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Please confirm'),
      content: const Text('Do you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    //KODING BARU REGISTER
    NewAuthProvider newAuthProvider = Provider.of<NewAuthProvider>(context);

    doRegister() async {
      final Future<Map<String, dynamic>> successfullMessage =
          newAuthProvider.register(nameController.text, usernameController.text,
              emailController.text, passwordController.text);
      successfullMessage.then(
        (response) {
          if (response['status']) {
            User user = response['user'];
            Provider.of<UserProvider>(context, listen: false).setUser(user);
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  'Gagal Register!',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
        },
      );
    }
    //BATAS KODING BARU

    // Handle Register
    handleRegister() async {
      setState(() {
        _isLoading = true;
      });

      if (await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Gagal Register!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        _isLoading = false;
      });
    }

    // Header Image
    Widget buildHeaderImage() {
      return Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
          width: 120,
          height: 120,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo_coffein.png'),
            ),
          ),
        ),
      );
    }

    // Header Tittle
    Widget buildHeaderTittle() {
      return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            Text(
              'Resigtrasi',
              style:
                  primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Lakukan registrasi akun anda untuk menggunakan aplikasi',
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    // Form Fullname
    Widget buildFullNameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Container(
          alignment: Alignment.centerLeft,
          height: 55,
          decoration: BoxDecoration(
            color: backgroundColor1,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            controller: nameController,
            showCursor: true,
            keyboardType: TextInputType.text,
            cursorColor: primaryColor,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: primaryColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Masukkan Nama Lengkap',
                hintStyle: subtitleTextStyle.copyWith(fontSize: 14)),
          ),
        ),
      );
    }

    // Form Username
    Widget buildUsernameInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Container(
          alignment: Alignment.centerLeft,
          height: 55,
          decoration: BoxDecoration(
            color: backgroundColor1,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            controller: usernameController,
            showCursor: true,
            keyboardType: TextInputType.text,
            cursorColor: primaryColor,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: primaryColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Masukkan Username',
                hintStyle: subtitleTextStyle.copyWith(fontSize: 14)),
          ),
        ),
      );
    }

    // Form Email
    Widget buildEmailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Container(
          alignment: Alignment.centerLeft,
          height: 55,
          decoration: BoxDecoration(
            color: backgroundColor1,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            controller: emailController,
            showCursor: true,
            keyboardType: TextInputType.text,
            cursorColor: primaryColor,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: primaryColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Masukkan Email',
                hintStyle: subtitleTextStyle.copyWith(fontSize: 14)),
          ),
        ),
      );
    }

    // Form Password
    Widget buildPasswordInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Container(
          alignment: Alignment.centerLeft,
          height: 55,
          decoration: BoxDecoration(
            color: backgroundColor1,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            controller: passwordController,
            obscureText: !_passwordVisible,
            showCursor: true,
            cursorColor: primaryColor,
            keyboardType: TextInputType.visiblePassword,
            style: primaryTextStyle,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: primaryColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Masukkan Kata Sandi',
                hintStyle: subtitleTextStyle.copyWith(fontSize: 14)),
          ),
        ),
      );
    }

    // Form Confirm Password
    Widget buildConfirmPasswordInput() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Container(
          alignment: Alignment.centerLeft,
          height: 55,
          decoration: BoxDecoration(
            color: backgroundColor1,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            obscureText: !_passwordVisible,
            showCursor: true,
            cursorColor: primaryColor,
            keyboardType: TextInputType.visiblePassword,
            style: primaryTextStyle,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: primaryColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Konfirmasi Kata Sandi',
                hintStyle: subtitleTextStyle.copyWith(fontSize: 14)),
          ),
        ),
      );
    }

    // button Register
    Widget buildRegisterButton() {
      return Container(
        height: 55,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 15),
        child: TextButton(
          onPressed: doRegister,
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Text(
            'Daftar',
            style: subtitleTextStyle.copyWith(
                fontSize: 16, fontWeight: bold, color: Colors.white),
          ),
        ),
      );
    }

    // Footer
    Widget buildFooter() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah punya akun? ',
              style: primaryTextStyle.copyWith(fontSize: 14),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/login',
                );
              },
              child: Text(
                "Masuk",
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                  color: secondaryColor,
                ),
              ),
            )
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildHeaderImage(),
                    buildHeaderTittle(),
                    buildFullNameInput(),
                    buildUsernameInput(),
                    buildEmailInput(),
                    buildPasswordInput(),
                    buildConfirmPasswordInput(),
                    const SizedBox(
                      height: 20,
                    ),
                    _isLoading ? LoadingButton() : buildRegisterButton(),
                    const SizedBox(
                      height: 25,
                    ),
                    buildFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
