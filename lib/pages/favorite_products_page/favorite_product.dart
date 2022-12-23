import 'package:craftshop_indonesia/providers/page_provider.dart';
import 'package:craftshop_indonesia/providers/wishlist_provider.dart';
import 'package:craftshop_indonesia/widget/custom_bottom_navigation.dart';
import 'package:craftshop_indonesia/widget/custom_button.dart';
import 'package:craftshop_indonesia/widget/custom_wishlist_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/theme.dart';

class FavoriteProductsPage extends StatelessWidget {
  const FavoriteProductsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget header(){
      return AppBar(
        backgroundColor: kBrandColor,
        centerTitle: true,
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        title: Text(
          'Favorite Products',
          style: kWhiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,

          ),
        ),
        elevation: 0,
      );
    }
    Widget emptyPage(){
      return Expanded(
          child: Container(
            color: kWhiteColor,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon_loved.png',
                  width: 80,
                ),
                SizedBox(height: 20.0),
                Text(
                  ' You don\'t have one?',
                  style: kBlackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Let\'s find your favorite Products' ,
                  style: kGreyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
                SizedBox(height: 16),
                CustomButton(
                  title: 'Explore Store',
                  height: 50,
                  width: 150,
                  pressed: (){
                    pageProvider.currentIndex = 0;
                  },
                  customColor: kBrandColor,
                  customFontWeight: medium,
                )
              ],
            ),
          )
      );
    }
    Widget content(){
      return Expanded(
        child: Container(
          color: kWhiteColor,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            children: wishlistProvider.wishlist
                .map(
                    (product) => CustomWishlistTile(product)
                )
                .toList()
            /*
            [
              CustomWishlistTile(thumbnail: 'c_home_listpic1.png', title: 'Rosio Montonya Figurative X3', price: 'IDR 2.700.000'),
              CustomWishlistTile(thumbnail: 'c_home_listpic2.png', title: 'Rosio Montonya Figurative J8', price: 'IDR 2.100.000'),
            ],
            */
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          header(),
          wishlistProvider.wishlist.length == 0 ? emptyPage() : content(),
        ],
      ),
    );
  }
}
