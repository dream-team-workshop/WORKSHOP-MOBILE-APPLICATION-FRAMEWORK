import 'dart:async';

import 'package:brk_mobile/pages/login_page.dart';
import 'package:brk_mobile/pages/on_boarding_page.dart';
import 'package:brk_mobile/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    getInit();
    startSplashScreen();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts;

    // Timer(
    //   Duration(seconds: 3),
    //   (() => Navigator.pushReplacementNamed(context, '/login')),
    // );
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(
      duration,
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          child: Image.asset('assets/images/logo_coffein.png'),
        ),
      ),
    );
  }
}
