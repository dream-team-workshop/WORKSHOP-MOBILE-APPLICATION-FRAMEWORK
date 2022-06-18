import 'package:flutter/material.dart';
import 'package:brk_mobile/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent() {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/icon_empty_cart.png',
                width: 80.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'You made a transaction',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                'Stay at home while we prepare your dream coffe\'s',
                style: subtitleTextStyle,
                textAlign: TextAlign.center,
              ),
              Container(
                width: 200.0,
                height: 45.0,
                margin: EdgeInsets.only(top: defaultMargin),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                    ),
                  ),
                  child: Text(
                    'Order Other Coffe\'s',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
              Container(
                width: 200.0,
                height: 45.0,
                margin: EdgeInsets.only(top: 20.0),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xffB0B0C0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                    ),
                  ),
                  child: Text(
                    'View My Order',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text('Checkout Success'),
      ),
      body: buildContent(),
    );
  }
}
