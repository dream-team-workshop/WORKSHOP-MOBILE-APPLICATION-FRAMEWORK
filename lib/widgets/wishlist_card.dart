import 'package:flutter/material.dart';
import 'package:brk_mobile/theme.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.only(
        top: 10.0,
        left: 12.0,
        bottom: 14.0,
        right: 20.0,
      ),
      decoration: BoxDecoration(
        color: backgroundColor3,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              'assets/images/img_product_chat.png',
              width: 60.0,
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
                  'Cinnamon Doice Latte',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Rp. 30.000',
                  style: secondaryTextStyle,
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/img_wishlist.png',
            width: 24.0,
          ),
        ],
      ),
    );
  }
}
