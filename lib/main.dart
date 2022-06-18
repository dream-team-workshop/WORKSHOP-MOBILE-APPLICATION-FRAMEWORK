import 'package:brk_mobile/pages/cart_page.dart';
import 'package:brk_mobile/pages/checkout_page.dart';
import 'package:brk_mobile/pages/checkout_success_page.dart';
import 'package:brk_mobile/pages/detail_chat_page.dart';
import 'package:brk_mobile/pages/edit_profile.dart';
import 'package:brk_mobile/pages/home/main_page.dart';
import 'package:brk_mobile/pages/login_page.dart';
import 'package:brk_mobile/pages/product_page.dart';
import 'package:brk_mobile/pages/register_page.dart';
import 'package:brk_mobile/providers/auth_provider.dart';
import 'package:brk_mobile/providers/cart_provider.dart';
import 'package:brk_mobile/providers/product_provider.dart';
import 'package:brk_mobile/providers/transaction_provider.dart';
import 'package:brk_mobile/providers/wishlist_provider.dart';
import 'package:brk_mobile/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:brk_mobile/pages/splash_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ProductService().getProducts().then((value) => print("value: $value"));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          // '/product': (context) => ProductPage(context),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
