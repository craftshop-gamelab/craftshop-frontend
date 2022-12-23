import 'package:craftshop_indonesia/models/product_model.dart';
import 'package:craftshop_indonesia/widget/custom_button.dart';
import 'package:craftshop_indonesia/widget/custom_button_outlined.dart';
import 'package:craftshop_indonesia/widget/custom_button_reversed.dart';
import 'package:flutter/material.dart';
import '../shared/theme.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final ProductModel product;

  const ChatBubble({
    Key key,
    this.text = '',
    this.isSender = false,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget productPreview(){
      return Container(
        width: 234,
        height: 155,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: kFieldGreyColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isSender ? 12 : 0),
              topRight: Radius.circular(isSender ? 0 : 12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(product.galleries[0].url),
                      fit: BoxFit.cover
                      ),
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  children: [
                    Container(
                      width: 122,
                      height: 42,
                      child: Text(
                        product.name,
                        style: kBlackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: 122,
                      height: 42,
                      child: Text(
                        'IDR ${product.price}',
                        style: kCyanTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                CustomButtonOutlined(
                  title: 'Add to Cart',
                  pressed: (){},
                  height: 41,
                  width: 118,
                  customColor: kFieldGreyColor,
                  customFontSize: 14,
                ),
                SizedBox(width: 8),
                CustomButton(
                  title: 'Buy Now',
                  pressed: (){},
                  height: 41,
                  width: 84,
                  customColor: kBrandColor,
                  customFontSize: 14,
                  customFontWeight: medium,
                )
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          product is UninitializedProductModel ? SizedBox(height: 0) : productPreview(),
          Row(
            mainAxisAlignment: isSender ? MainAxisAlignment.end :  MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 226,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12
                  ),
                  decoration: BoxDecoration(
                    color: kFieldGreyColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender ? 12 : 0),
                      topRight: Radius.circular(isSender ? 0 : 12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    )
                  ),
                  child: Text(
                    text,
                    style: kBlackTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 14
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
