import 'package:brk_mobile/models/user.dart';
import 'package:brk_mobile/models/user_model.dart';
import 'package:brk_mobile/networks/api.dart';
import 'package:brk_mobile/preferences/userPreferences.dart';
import 'package:brk_mobile/providers/auth_provider.dart';
import 'package:brk_mobile/providers/product_provider.dart';
import 'package:brk_mobile/providers/user_provider.dart';
import 'package:brk_mobile/services/auth_service.dart';
import 'package:brk_mobile/theme.dart';
import 'package:brk_mobile/widgets/product_item.dart';
import 'package:brk_mobile/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:brk_mobile/widgets/product_card.dart';
import 'package:provider/provider.dart';
import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? id;
  String? nama, username, token;

  void getUserData() {
    UserPreferences().getUser().then((value) {
      print("value: $value");
      id = value.id!;
      nama = value.name!;
      username = value.username!;
      token = value.token!;
      print(id);
      print(nama);
      print(username);
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductProvider>(context, listen: false).getProducts();
    });

    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // UserModel user = authProvider.user;

    //KODINGAN BARU LOGIN
    // User userNew = Provider.of<UserProvider>(context).user;
    // User userMagic = User();
    //BATAS KODINGAN BARU

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 12,
          right: 12,
        ),
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              child: GestureDetector(
                onTap: () {},
                // child: Image.network(user.profilePhotoUrl!),
                child: Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo, $nama',
                    // 'Halo, ',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '@$username',
                    // '@username',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/cart');
                },
                child: Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      );
    }
    // Widget header() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //       top: 20,
    //       left: 12,
    //       right: 12,
    //     ),
    //     child: Column(children: [
    //       FutureBuilder<UserModel>(
    //         future: AuthService().getDataUserNow(),
    //         builder: (context, snapshot) {
    //           if (snapshot.connectionState == ConnectionState.waiting) {
    //             return Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           }
    //           UserModel user = snapshot.data!;
    //           return Padding(
    //             padding: EdgeInsets.all(4),
    //             child: Row(
    //               children: [
    //                 Container(
    //                   width: 54,
    //                   height: 54,
    //                   child: GestureDetector(
    //                     onTap: () {},
    //                     child: Icon(
    //                       Icons.person,
    //                       size: 30,
    //                     ),
    //                   ),
    //                 ),
    //                 Expanded(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         'Hallo, ${user.name}',
    //                         // 'Hallo',
    //                         style: primaryTextStyle.copyWith(
    //                           fontSize: 20,
    //                           fontWeight: semiBold,
    //                         ),
    //                       ),
    //                       Text(
    //                         // '@${user.token}',
    //                         '@username',
    //                         style: subtitleTextStyle.copyWith(
    //                           fontSize: 16,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Container(
    //                   width: 54,
    //                   height: 54,
    //                   child: GestureDetector(
    //                     onTap: () {
    //                       Navigator.pushNamed(context, '/cart');
    //                     },
    //                     child: Icon(
    //                       Icons.shopping_cart,
    //                       size: 30,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           );
    //         },
    //       ),
    //     ]),
    //   );
    // }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor,
                ),
                child: Text(
                  'Semua',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: accentColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'Kopi #',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: accentColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'Kopi #',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: accentColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'Kopi #',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: accentColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'Kopi #',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProductsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Paling Populer',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Consumer<ProductProvider>(
                  builder: (context, productProvider, child) {
                return Row(
                  children: productProvider.products.map((product) {
                    return ProductCard(product);
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Varian Baru',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
          margin: EdgeInsets.only(
            top: 14,
          ),
          child: Consumer<ProductProvider>(
            builder: (context, productModel, child) => GridView.builder(
              itemCount: productModel.products.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 280,
              ),
              itemBuilder: (ctx, index) {
                return ProductItem(
                  product: productModel.products[index],
                );
              },
            ),
          ));
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularProductsTitle(),
        popularProducts(),
        newArrivalsTitle(),
        newArrivals(),
      ],
    );
  }
}
