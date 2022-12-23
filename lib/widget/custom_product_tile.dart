import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomProductTile extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String category;
  final String price;

  const CustomProductTile({
    Key key,
    this.thumbnail = 'assets/not_found.gif',
    this.title = 'Product Not Found',
    this.category = 'Uncategorized',
    this.price = '-'
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: EdgeInsets.only(right: kDefaultMargin),
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          // NOTE : THUMBNAIL
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
          SizedBox(width: 12),

          // NOTE : TITLE
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE : CATEGORY
                SizedBox(height: 10),
                Text(
                  category,
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
                    title,
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
                      price,
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
    );
  }
}
