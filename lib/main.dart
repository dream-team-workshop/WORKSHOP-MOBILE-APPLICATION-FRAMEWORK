import 'package:brk_mobile/pages/login_page.dart';
import 'package:brk_mobile/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:brk_mobile/pages/splash_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
