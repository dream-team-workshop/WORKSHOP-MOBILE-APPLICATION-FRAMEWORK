import 'package:brk_mobile/models/product_model.dart';
import 'package:brk_mobile/pages/product_page.dart';
import 'package:brk_mobile/theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(product)));
      },
      child: Container(
        width: 190,
        height: 268,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
          color: thirdColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(const Radius.circular(20)),
        
          child: Image.network(
              // 'assets/images/logo_coffein.png',
              product.galleries![0].url!,
              fit: BoxFit.cover,
            ),
        )
      ),
    );
  }
}
