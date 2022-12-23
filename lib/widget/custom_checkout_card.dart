import 'package:craftshop_indonesia/models/cart_model.dart';
import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomCheckoutCard extends StatelessWidget {
  final CartModel cart;
  CustomCheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      margin: EdgeInsets.only(top: 10),
      color: kFieldGreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(cart.product.galleries[0].url),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Container(
                    width: 168,
                    child: Text(
                      cart.product.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: kBlackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'IDR ${cart.product.price}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: kCyanTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            '${cart.quantity} items',
            style: kGreyTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular
            ),
          )
        ],
      ),
    );
  }
}
