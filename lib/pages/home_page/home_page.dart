import 'package:craftshop_indonesia/models/user_model.dart';
import 'package:craftshop_indonesia/providers/auth_provider.dart';
import 'package:craftshop_indonesia/providers/product_provider.dart';
import 'package:craftshop_indonesia/widget/custom_product_card.dart';
import 'package:craftshop_indonesia/widget/custom_product_card_online.dart';
import 'package:craftshop_indonesia/widget/custom_product_tile.dart';
import 'package:craftshop_indonesia/widget/custom_product_tile_online.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/theme.dart';
import 'dart:convert';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget header(){
      return Container(
        margin: EdgeInsets.only(bottom: 20,right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kBlackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 24
                    ),
                  ),
                  Text(
                    '@${user.username}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kBlackTextStyle.copyWith(
                        fontWeight: regular,
                        fontSize: 16
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/profile-page-detail');
              },
              child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                        image: NetworkImage(user.profilePhotoUrl))
                ),
              ),
            ),
          ],
        ),
      );
    }
    Widget categories(){
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: kBrandColor,
                  border: Border.all(width: 0.5, color: kBrandColor),
                ),
                child: Text(
                  'All Products',
                  style: kWhiteTextStyle.copyWith(
                      color: kWhiteColor,
                      fontSize: 13,
                      fontWeight: medium
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  border: Border.all(width: 0.5, color: kBlackColor),
                ),
                child: Text(
                  'Paintings',
                  style: kWhiteTextStyle.copyWith(
                      color: kBlackColor,
                      fontSize: 13,
                      fontWeight: medium
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  border: Border.all(width: 0.5, color: kBlackColor),
                ),
                child: Text(
                  'Fine Arts',
                  style: kWhiteTextStyle.copyWith(
                      color: kBlackColor,
                      fontSize: 13,
                      fontWeight: medium
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  border: Border.all(width: 0.5, color: kBlackColor),
                ),
                child: Text(
                  'Applied Arts',
                  style: kWhiteTextStyle.copyWith(
                      color: kBlackColor,
                      fontSize: 13,
                      fontWeight: medium
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  border: Border.all(width: 0.5, color: kBlackColor),
                ),
                child: Text(
                  'Clothing',
                  style: kWhiteTextStyle.copyWith(
                      color: kBlackColor,
                      fontSize: 13,
                      fontWeight: medium
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  border: Border.all(width: 0.5, color: kBlackColor),
                ),
                child: Text(
                  'Traditional',
                  style: kWhiteTextStyle.copyWith(
                      color: kBlackColor,
                      fontSize: 13,
                      fontWeight: medium
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    Widget popularProductsTitle(){
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Text(
          'Popular Products',
          style: kBlackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 18
          ),
        ),
      );
    }
    Widget popularProducts(){
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Row(
                // NOTES : DYNAMIC PRODUCT DATA
                children: productProvider.products
                    .map(
                        (product) => ProductCardOnline(product),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }
    Widget newArrivalsTitle(){
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Text(
          'Trending Products',
          style: kBlackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 18
          ),
        ),
      );
    }
    Widget newArrivals(){
      return Container(
        child: Column(
          children: productProvider.products
              .map(
                (product) => CustomProductTileOnline(product),
              )
              .toList(),
        ),
      );
    }

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.only(top: kDefaultMargin, left: kDefaultMargin, right: 1),
        children: [
          header(),
          categories(),
          popularProductsTitle(),
          popularProducts(),
          newArrivalsTitle(),
          newArrivals(),
        ],
      ),
    );
  }
}
