import 'package:craftshop_indonesia/models/product_model.dart';
import 'package:craftshop_indonesia/pages/product_page/product_detail.dart';
import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomProductTileOnline extends StatelessWidget {
  final ProductModel product;
  CustomProductTileOnline(this.product);

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
        width: double.infinity,
        height: 120,
        padding: EdgeInsets.only(right: kDefaultMargin),
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            // NOTE : THUMBNAIL
            Image.network(
              product.galleries[0].url,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            )
          /*
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(thumbnail)
                )
              ),
            ),
            */
            ,SizedBox(width: 12),

            // NOTE : TITLE
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NOTE : CATEGORY
                  SizedBox(height: 10),
                  Text(
                    product.category.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kBlackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular
                    ),
                  ),

                  // NOTE : TITLE
                  Expanded(
                    child: Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kBlackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold
                      ),
                    ),
                  ),

                  // NOTE : PRICE
                  Row(
                    children: [
                      Text(
                        'IDR ',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kCyanTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium
                        ),
                      ),
                      Text(
                        '${product.price}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kCyanTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
