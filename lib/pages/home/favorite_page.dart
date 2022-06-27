import 'package:brk_mobile/providers/page_provider.dart';
import 'package:brk_mobile/providers/wishlist_provider.dart';
import 'package:brk_mobile/theme.dart';
import 'package:brk_mobile/widgets/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {

    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PageProvier pageProvier = Provider.of<PageProvier>(context);

    Widget buildHeader() {
      return AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Kopi Favorit',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget buildEmptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/img_wishlist.png',
                width: 74,
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                'Belum ada kopi yang disukai',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text('Ayo temukan kopi favoritmu',
                  style: subtitleTextStyle),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {
                    pageProvier.currentIndex =0;
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 24.0,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    'Telusuri Kopi',
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

    Widget buildContent() {
      return Expanded(
        child: Container(
          color: whiteColor,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            children: wishlistProvider.wishlist.map((product) => WishlistCard(product)).toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        buildHeader(),
        // buildEmptyWishlist(),
        wishlistProvider.wishlist.length == 0 ? buildEmptyWishlist() : buildContent(),
      ],
    );
  }
}
