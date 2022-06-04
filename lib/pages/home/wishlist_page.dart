import 'package:flutter/material.dart';
import 'package:brk_mobile/theme.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildHeader() {
      return AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Favorite Coffe',
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget buildEmptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
        ),
      );
    }

    return Column(
      children: [
        buildHeader(),
        buildEmptyWishlist(),
      ],
    );
  }
}
