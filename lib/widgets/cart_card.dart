import 'package:brk_mobile/models/cart_model.dart';
import 'package:brk_mobile/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:brk_mobile/theme.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {

    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor1,
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
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
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Rp. ${cart.product!.price!}',
                      style: secondaryTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      cartProvider.addQuantity(cart.id!);
                    },
                    child: Image.asset(
                      'assets/images/btn_plus.png',
                      height: 30.0,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  GestureDetector(
                    onTap: (){
                      cartProvider.reduceQuantity(cart.id!);
                    },
                    child: Image.asset(
                      'assets/images/btn_min.png',
                      height: 30.0,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          GestureDetector(
            onTap: (){
              cartProvider.removeCart(cart.id!);
            },
            child: Row(
              children: [
                Icon(
                  Icons.delete,
                  size: 16.0,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                  'Hapus',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: regular,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
