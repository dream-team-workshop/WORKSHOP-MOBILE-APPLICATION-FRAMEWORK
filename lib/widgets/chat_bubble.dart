import 'package:brk_mobile/models/product_model.dart';
import 'package:brk_mobile/theme.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  String text;
  bool isSender;
  final ProductModel? product;

  ChatBubble({
    this.isSender = false, 
    this.text = '',
    this.product,
    });

  @override
  Widget build(BuildContext context) {
    Widget buildProductPreview() {
      return Container(
        width: 230,
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              isSender ? 12 : 0,
            ),
            topRight: Radius.circular(
              isSender ? 0 : 12,
            ),
            bottomLeft: Radius.circular(
              12,
            ),
            bottomRight: Radius.circular(
              12.0,
            ),
          ),
          color: isSender ? backgroundColor3 : backgroundColor2,
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product!.galleries![0].url!,
                    width: 70,
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
                        product!.name!,
                        style: primaryTextStyle,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Rp. ${product!.price!}',
                        style: secondaryTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: primaryColor,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: primaryTextStyle,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                    ),
                  ),
                  child: Text(
                    'Buy Now',
                    style: whiteTextStyle.copyWith(fontWeight: medium),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 30.0,
      ),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          product is UninitializedProductModel ? SizedBox() : buildProductPreview(),
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        isSender ? 12 : 0,
                      ),
                      topRight: Radius.circular(
                        isSender ? 0 : 12,
                      ),
                      bottomLeft: Radius.circular(
                        12,
                      ),
                      bottomRight: Radius.circular(
                        12.0,
                      ),
                    ),
                    color: isSender ? backgroundColor3 : backgroundColor2,
                  ),
                  child: Text(
                    text,
                    style: primaryTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
