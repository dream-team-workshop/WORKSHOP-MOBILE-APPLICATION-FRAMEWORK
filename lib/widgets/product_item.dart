import 'package:brk_mobile/models/product_model.dart';
import 'package:brk_mobile/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:brk_mobile/theme.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 6, right: 4),
      child: InkWell(
        onTap: () {
              Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(product)));
        },
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: thirdColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.galleries?[0].url ?? "",
                width: double.infinity,
                height: 190,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:  primaryTextStyle.copyWith(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(height: 4,),
                    Text("Rp ${product.price}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}