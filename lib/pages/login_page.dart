import 'package:brk_mobile/pages/register_page.dart';
import 'package:brk_mobile/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  bool _isRememberMe = false;

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
            Text(
              'Welcome in Coffeein',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Sign In to Continue',
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    // Form Email
    Widget buildEmailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 35),
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
                hintText: 'Your Email Address',
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

    // buttonFrogotPassword
    Widget buildForgotPassword() {
      return Container(
        margin: const EdgeInsets.only(top: 2),
        child: Container(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              // Lupa Password
            },
            child: Text(
              "Lupa Password?",
              textAlign: TextAlign.right,
              style: subtitleTextStyle.copyWith(
                fontSize: 14,
                fontWeight: light,
                color: secondaryColor,
              ),
            ),
          ),
        ),
      );
    }

    // remember me
    Widget buildRememberMe() {
      return Container(
        height: 30,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: _isRememberMe,
              activeColor: primaryColor,
              checkColor: Colors.white,
              onChanged: ((value) {
                setState(
                  () {
                    _isRememberMe = value!;
                  },
                );
              }),
            ),
            Text(
              'Remember Me',
              style: subtitleTextStyle.copyWith(
                fontSize: 14,
                fontWeight: light,
                color: secondaryColor,
              ),
            ),
          ],
        ),
      );
    }

    // buttonLogin
    Widget buildLoginButton() {
      return Container(
        height: 55,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 15),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Text(
            'Login',
            style: subtitleTextStyle.copyWith(
                fontSize: 16, fontWeight: bold, color: Colors.white),
          ),
        ),
      );
    }

    Widget buildDivider() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: const Divider(
                color: Colors.black54,
                height: 36,
              ),
            ),
          ),
          Text(
            "OR",
            style: subtitleTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              color: Colors.black54,
            ),
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: const Divider(
                  color: Colors.black54,
                  height: 36,
                )),
          ),
        ]),
      );
    }

    Widget buildOtherLoginMethodsSection() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              // splashColor: Colors.grey[700],
              onTap: () {},
              child: Image.asset(
                'assets/images/icon_google.png',
                height: 55,
                width: 55,
              ),
            ),
          ],
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
              'Don\'t have an account? ',
              style: primaryTextStyle.copyWith(fontSize: 14),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
              },
              child: Text(
                "Register",
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeaderImage(),
                  buildHeaderTittle(),
                  buildEmailInput(),
                  buildPasswordInput(),
                  buildForgotPassword(),
                  buildRememberMe(),
                  buildLoginButton(),
                  buildDivider(),
                  buildOtherLoginMethodsSection(),
                  const SizedBox(height: 25),
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
