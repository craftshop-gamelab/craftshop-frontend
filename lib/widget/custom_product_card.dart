import 'package:craftshop_indonesia/models/product_model.dart';
import 'package:flutter/material.dart';
import '../shared/theme.dart';

class ProductCard extends StatelessWidget {

  final String thumbnail;
  final String title;
  final String category;
  final String price;

  const ProductCard({
    Key key,
    this.thumbnail = 'assets/not_found.gif',
    this.title = 'Product Not Found',
    this.category = 'Uncategorized',
    this.price = '-',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/product-page-detail');
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
            Container(
              width: double.infinity,
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(thumbnail)
                )
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kGreyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular
                    ),
                  ),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kDarkGreyTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold
                    ),
                  ),
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
                        price,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kCyanTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
