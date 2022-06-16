import 'dart:async';

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
    getInit();

    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts;

    Navigator.pushReplacementNamed(context, '/login');
    // Timer(
    //   Duration(seconds: 3),
    //   (() => Navigator.pushReplacementNamed(context, '/login')),
    // );
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
