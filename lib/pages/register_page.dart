import 'package:brk_mobile/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:brk_mobile/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Header Image
    Widget buildHeaderImage() {
      return Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              'Please  register your account first. You still don\'t have an account?',
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
                hintText: 'Password',
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
                hintText: 'Confirm Password',
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
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Text(
            'Register',
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
              'Already have account? ',
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
                "Login",
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

    return Scaffold(
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
                  buildRegisterButton(),
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
    );
  }
}
