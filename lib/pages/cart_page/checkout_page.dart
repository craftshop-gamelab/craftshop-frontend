import 'package:craftshop_indonesia/providers/auth_provider.dart';
import 'package:craftshop_indonesia/providers/cart_provider.dart';
import 'package:craftshop_indonesia/providers/transaction_provider.dart';
import 'package:craftshop_indonesia/widget/custom_address_card.dart';
import 'package:craftshop_indonesia/widget/custom_button_checkout.dart';
import 'package:craftshop_indonesia/widget/custom_button_loading.dart';
import 'package:craftshop_indonesia/widget/custom_checkout_card.dart';
import 'package:craftshop_indonesia/widget/custom_button.dart';
import 'package:craftshop_indonesia/widget/custom_payment_summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/theme.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider = Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleCheckout() async {

      setState(() {
        isLoading = true;
      });

      if(await transactionProvider.checkout(
          authProvider.user.token,
          cartProvider.carts,
          cartProvider.totalPrice()
      )){
        cartProvider.carts = [];
        Navigator.pushNamedAndRemoveUntil(context, '/checkout-success-page', (route) => false);
      }

      setState(() {
        isLoading = false;
      });

    }

    PreferredSize header(){
      return PreferredSize(
          child:AppBar(
            backgroundColor: kBrandColor,
            centerTitle: true,
            toolbarHeight: 90,
            title: Text(
              'Checkout Details',
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
    Widget content(){
      return ListView(
        padding: EdgeInsets.only(left: kDefaultMargin, right: kDefaultMargin),
        children: [
          // LIST ITEMS
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'List Items',
                  style: kBlackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium
                  ),
                ),
                SizedBox(height: 2),

                // CARDS

              ],
            ),
          ),

          // CARDS
          //CustomCheckoutCard(),
          Column(
            children: cartProvider.carts
                .map(
                    (cart) => CustomCheckoutCard(cart)
                )
                .toList(),
          ),

          CustomAddressCard(),

          // NOTES : PAYMENT SUMMARY
          Container(
            height: 230,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: EdgeInsets.only(top: 20),
            color: kFieldGreyColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: kBlackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Quantity',
                        style: kBlackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: regular
                        ),
                      ),
                      Text(
                        '${cartProvider.totalItems()} Items',
                        style: kBlackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Price',
                        style: kBlackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: regular
                        ),
                      ),
                      Text(
                        'IDR ${cartProvider.totalPrice()}',
                        style: kBlackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping',
                        style: kBlackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: regular
                        ),
                      ),
                      Text(
                        'Free',
                        style: kBlackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Divider(),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: kCyanTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold
                        ),
                      ),
                      Text(
                        'IDR ${cartProvider.totalPrice()}',
                        style: kCyanTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }
    Widget checkoutButton(){
      return GestureDetector(
        child: Container(
          height: 112,
          width: double.infinity,
          padding: EdgeInsets.only(right: kDefaultMargin,left: kDefaultMargin,bottom: 28, top: 28),
          child: Column(
            children: [

              isLoading ?
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: CustomButtonLoading()
              )
              :
              CustomButton(
                  height: 51,
                  title: 'Checkout Now',
                  customFontSize: 16,
                  customFontWeight: semiBold,
                  pressed: handleCheckout,
                  customColor: kBrandColor
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      body: content(),
      backgroundColor: kWhiteColor,
      bottomNavigationBar:
      isLoading ?
      CustomButtonLoading(
        height: 50,
        customColor: kBrandColor,
        customFontWeight: medium,
      )
          :
      checkoutButton(),
    );
  }
}
