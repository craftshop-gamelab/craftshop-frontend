import 'package:craftshop_indonesia/models/product_model.dart';
import 'package:craftshop_indonesia/pages/product_page/product_detail.dart';
import 'package:flutter/material.dart';
import '../shared/theme.dart';

class ProductCardOnline extends StatelessWidget {

  final ProductModel product;
  ProductCardOnline(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product),
          ),
        );
      },
      child: Container(
        height: 278,
        width: 215,
        color: kFieldGreyColor,
        margin: EdgeInsets.only(right: kDefaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOTES : PRODUCT THUMBNAIL & TITLE
            /*
            Image.network(
              product.galleries[0].url,
              width: double.infinity,
              height: 190,
              fit: BoxFit.cover,
            ),
            */
            Container(
              width: double.infinity,
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.galleries[0].url)
                )
              ),
            ),

            // NOTES : PRODUCT INFO
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kGreyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular
                    ),
                  ),
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kDarkGreyTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold
                    ),
                  ),
                  Text(
                    'IDR ${product.price}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kCyanTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
