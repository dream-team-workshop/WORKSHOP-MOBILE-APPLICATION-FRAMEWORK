import 'package:brk_mobile/models/product_model.dart';
import 'package:brk_mobile/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:brk_mobile/theme.dart';
import 'package:provider/provider.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;
  WishlistCard(this.product);

  @override
  Widget build(BuildContext context) {

    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

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
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              // 'assets/images/img_product_chat.png',
              product.galleries![0].url!,
              width: 65.0,
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
                  // 'Cinnamon Doice Latte',
                  product.name!,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  // 'Rp. 30.000',
                  'Rp. ${product.price}',
                  style: secondaryTextStyle,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              wishlistProvider.setProduct(product);
            },
            child: Image.asset(
              'assets/images/img_wishlist.png',
              width: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
