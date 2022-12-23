import 'package:craftshop_indonesia/providers/cart_provider.dart';
import 'package:craftshop_indonesia/providers/page_provider.dart';
import 'package:craftshop_indonesia/widget/custom_bottom_navigation.dart';
import 'package:craftshop_indonesia/widget/custom_button.dart';
import 'package:craftshop_indonesia/widget/custom_cart_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/theme.dart';

class CartPage extends StatelessWidget {
  final bool isContentEmpty;

  const CartPage({
    Key key,
    this.isContentEmpty = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CartProvider cartProvider = Provider.of<CartProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    PreferredSize header(){
      return PreferredSize(
          child:AppBar(
            backgroundColor: kBrandColor,
            centerTitle: true,
            toolbarHeight: 90,
            automaticallyImplyLeading: false,
            title: Text(
              'Your Cart',
              style: kWhiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,

              ),
            ),
            elevation: 0,
            // automaticallyImplyLeading: false,
          ),
          preferredSize: Size.fromHeight(88)
      );
    }
    Widget empty(){
      return ListView(
        children: [
          SizedBox(height: 200),
          Container(
            color: kWhiteColor,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon_cart.png',
                  width: 80,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Opss! Your Cart is Empty',
                  style: kBlackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Let\'s find your favorite shoes' ,
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
        ],
      );
    }
    Widget content(){
      return ListView(
        padding: EdgeInsets.only(left: kDefaultMargin, right: kDefaultMargin, top: 10),
        children: cartProvider.carts
            .map(
                (cart) => CustomCartCard(cart)
            )
            .toList(),
        /*
        children: [
          CustomCartCard(),
        ],
        */
      );
    }
    Widget continueToCheckout(){
      return Container(
        height: 140,
        width: double.infinity,
        padding: EdgeInsets.only(right: kDefaultMargin,left: kDefaultMargin,bottom: 24, top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: kBlackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular
                  ),
                ),
                Text(
                  'IDR ${cartProvider.totalPrice()}',
                  style: kCyanTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/checkout-page');
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: kBrandColor,
                margin: EdgeInsets.only(top: 18),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Checkout',
                      style: kWhiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold
                      ),
                    ),
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_arrow_right.png')
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: header(),
      body: cartProvider.carts.length == 0 ? empty() : content(),
      bottomNavigationBar: cartProvider.carts.length == 0 ? SizedBox() : continueToCheckout(),
    );
  }
}
