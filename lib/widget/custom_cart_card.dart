import 'package:craftshop_indonesia/models/cart_model.dart';
import 'package:craftshop_indonesia/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/theme.dart';

class CustomCartCard extends StatelessWidget {
  final CartModel cart;
  CustomCartCard(this.cart);

  @override
  Widget build(BuildContext context) {

    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
        width: double.infinity,
        height: 110,
        color: kFieldGreyColor,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // THUMBNAIL, TITLE & PRICE
            Row(
              children: [
                //THUMBNAIL
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(height: 12),
                    GestureDetector(
                      onTap: (){
                        cartProvider.removeCart(cart.id);
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icon_delete.png'),
                                )
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Remove',
                            style: kRedTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: light
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(width: 12),

                // TITTLE & PRICE
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // TITLE
                    SizedBox(height: 6),
                    Container(
                      width: 180,
                      child: Text(
                        cart.product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kBlackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold
                        ),
                      ),
                    ),

                    //PRICE
                    SizedBox(height: 2),
                    Text(
                      '${cart.product.price}',
                      style: kCyanTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),

            //COUNTER
            Column(
              children: [
                SizedBox(height: 16),
                GestureDetector(
                  onTap: (){
                    cartProvider.addQuantity(cart.id);
                    // _incrementCounter();
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/icon_increment.png')
                        )
                    ),
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  cart.quantity.toString(),
                  style: kBlackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium
                  ),
                ),
                SizedBox(height: 3),
                GestureDetector(
                  onTap: (){
                    cartProvider.reduceQuantity(cart.id);
                    // _decrementCounter();
                  },
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/icon_decrement.png')
                        )
                    ),
                  ),
                ),
              ],
            )
          ],
        )
    );
  }
}

