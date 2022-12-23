import 'package:craftshop_indonesia/models/product_model.dart';
import 'package:craftshop_indonesia/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/theme.dart';

class CustomWishlistTile extends StatelessWidget {

  final ProductModel product;
  CustomWishlistTile(this.product);

  /*
  final String thumbnail;
  final String title;
  final String price;
  final bool isLoved;

  const CustomWishlistTile({
    Key key,
    this.isLoved = true,
    this.thumbnail,
    this.title,
    this.price,
  }) : super(key: key);
  */

  @override
  Widget build(BuildContext context) {

    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(16),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kFieldGreyColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                image: NetworkImage(product.galleries[0].url),
              )
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 160,
                  height: 40,
                  child: Text(
                    product.name,
                    style: kBlackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  width: 94,
                  height: 21,
                  child: Text(
                    "${product.price}",
                    style: kCyanTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              wishlistProvider.setProduct(product);
            },
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_loved_pink.png'),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
