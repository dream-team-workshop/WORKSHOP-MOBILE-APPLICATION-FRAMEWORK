import 'package:brk_mobile/pages/cart_page.dart';
import 'package:brk_mobile/pages/detail_chat_page.dart';
import 'package:brk_mobile/pages/edit_profile.dart';
import 'package:brk_mobile/pages/home/main_page.dart';
import 'package:brk_mobile/pages/login_page.dart';
import 'package:brk_mobile/pages/product_page.dart';
import 'package:brk_mobile/pages/register_page.dart';
import 'package:brk_mobile/providers/auth_provider.dart';
import 'package:brk_mobile/providers/product_provider.dart';
import 'package:brk_mobile/providers/wishlist_provider.dart';
import 'package:brk_mobile/services/product_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:brk_mobile/pages/splash_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  
  }


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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/home': (context) => MainPage(),
          '/edit-profile': (context) => EditProfilePage(),
          // '/product': (context) => ProductPage(context),
          '/cart': (context) => CartPage(),
        },
      ),
    );
  }
}
