import 'dart:async';

import 'package:brk_mobile/pages/login_page.dart';
import 'package:brk_mobile/pages/on_boarding_page.dart';
import 'package:brk_mobile/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPageToOnBoard extends StatefulWidget {
  const SplashPageToOnBoard({super.key});

  @override
  State<SplashPageToOnBoard> createState() => _SplashPageToOnBoardState();
}

class _SplashPageToOnBoardState extends State<SplashPageToOnBoard> {

  @override
  void initState() {
    super.initState();

    getInit();
    startSplashScreen();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts;
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(
      duration,
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => OnBoardingScreen(),
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
