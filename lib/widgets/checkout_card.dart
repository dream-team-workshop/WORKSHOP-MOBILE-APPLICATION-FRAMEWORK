import 'package:brk_mobile/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:brk_mobile/theme.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cart;
  CheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 12.0,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 12.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12.0,
              ),
              image: DecorationImage(
                image: NetworkImage(
                  cart.product!.galleries![0].url!,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.product!.name!,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Text(
                  'Rp. ${cart.product!.price!}',
                  style: secondaryTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            '${cart.quantity} Items',
            style: subtitleTextStyle.copyWith(fontSize: 12.0),
          )
        ],
      ),
    );
  }
}
