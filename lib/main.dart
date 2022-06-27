import 'package:brk_mobile/networks/api.dart';
import 'package:brk_mobile/pages/cart_page.dart';
import 'package:brk_mobile/pages/checkout_page.dart';
import 'package:brk_mobile/pages/checkout_success_page.dart';
import 'package:brk_mobile/pages/home/main_page.dart';
import 'package:brk_mobile/pages/login_page.dart';
import 'package:brk_mobile/pages/register_page.dart';
import 'package:brk_mobile/pages/splash_page%20to_onboard.dart';
import 'package:brk_mobile/preferences/userPreferences.dart';
import 'package:brk_mobile/providers/auth_provider.dart';
import 'package:brk_mobile/providers/cart_provider.dart';
import 'package:brk_mobile/providers/new_auth_provider.dart';
import 'package:brk_mobile/providers/page_provider.dart';
import 'package:brk_mobile/providers/product_provider.dart';
import 'package:brk_mobile/providers/transaction_provider.dart';
import 'package:brk_mobile/providers/user_provider.dart';
import 'package:brk_mobile/providers/wishlist_provider.dart';
import 'package:brk_mobile/services/product_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:brk_mobile/pages/splash_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/user.dart';

int? isViewed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  print(isViewed);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ProductService().getProducts().then((value) => print("value: $value"));
    UserPreferences().getUser().then((value) => print("value: $value"));

    Future<User> getUserData() => UserPreferences().getUser();
    Future<String> getUserToken() => UserPreferences().getToken();

    return MultiProvider(
      providers: [
        //KODINGAN BARU UNTUK LOGIN
        ChangeNotifierProvider(create: (_) => NewAuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        //BATAS KODINGAN BARU
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Network(),
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
        ChangeNotifierProvider(
          create: (context) => PageProvier(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) =>
              isViewed != 0 ? SplashPageToOnBoard() : SplashPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/home': (context) => MainPage(),
          // '/edit-profile': (context) => EditProfilePage(),
          // '/product': (context) => ProductPage(context),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
