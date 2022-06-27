import 'package:brk_mobile/providers/cart_provider.dart';
import 'package:brk_mobile/providers/transaction_provider.dart';
import 'package:brk_mobile/widgets/checkout_card.dart';
import 'package:flutter/material.dart';
import 'package:brk_mobile/theme.dart';
import 'package:provider/provider.dart';

import '../preferences/userPreferences.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  String? nama, username, token;

  void getUserData() {
    UserPreferences().getUser().then((value) {
      print("value: $value");
      nama = value.name!;
      username = value.username!;
      token = 'Bearer ' + value.token!;
      print(nama);
      print(username);
      print(token);
    });
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {
      if (await transactionProvider.checkout(token!,
          cartProvider.carts, cartProvider.totalPrice())) {
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(
            context, '/checkout-success', (route) => false);
      }
    }

    Widget buildContent() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          //NOTE : LIST ITEM
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                Column(
                  children: cartProvider.carts
                      .map((cart) => CheckoutCard(cart))
                      .toList(),
                )
              ],
            ),
          ),

          //NOTE ADDRESS DETAIL
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Detail',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/icon_store_location.png',
                          width: 40.0,
                        ),
                        Image.asset(
                          'assets/images/icon_line.png',
                          height: 30.0,
                        ),
                        Image.asset(
                          'assets/images/icon_your_location.png',
                          width: 40.0,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alamat Caffe',
                          style: subtitleTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          'Coffein Core',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: defaultMargin,
                        ),
                        Text(
                          'Alamat Anda',
                          style: subtitleTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          'Bondowoso',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // NOTE PAYMENT SUMMARY
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      '${cartProvider.totalItems()} Items',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Price',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      'Rp. ${cartProvider.totalPrice()}',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 12.0,
                      ),
                    ),
                    Text(
                      'Free',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Divider(
                  thickness: 2,
                  color: backgroundColor4,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: secondaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Rp. ${cartProvider.totalPrice()}',
                      style: secondaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          //NOTE : CHECKOUT BUTTON
          SizedBox(
            height: defaultMargin,
          ),
          Divider(
            thickness: 2,
            color: backgroundColor4,
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: defaultMargin),
            child: TextButton(
              onPressed: handleCheckout,
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                ),
              ),
              child: Text(
                'Checkout Now',
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16.0,
                ),
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout Details',
          style: whiteTextStyle,
        ),
      ),
      body: buildContent(),
    );
  }
}
