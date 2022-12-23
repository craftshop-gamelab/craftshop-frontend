import 'package:craftshop_indonesia/widget/custom_button.dart';
import 'package:craftshop_indonesia/widget/custom_button_reversed.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget header(){
      return AppBar(
        backgroundColor: kBrandColor,
        centerTitle: true,
        toolbarHeight: 90,
        title: Text(
          'Checkout Success',
          style: kWhiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,

          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }
    Widget content(){
      return Expanded(
          child: Container(
            color: kWhiteColor,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon_cart.png',
                  width: 80,
                ),
                SizedBox(height: 20.0),
                Text(
                  'You made a transaction',
                  style: kBlackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Stay at home while we\n    prepare your order' ,
                  style: kGreyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
                SizedBox(height: 16),
                CustomButton(
                  title: 'Order Other Products',
                  height: 50,
                  width: 240,
                  pressed: (){
                    Navigator.pushNamedAndRemoveUntil(context, '/main-page', (route) => false);
                  },
                  customColor: kBrandColor,
                  customFontWeight: medium,
                ),
                SizedBox(height: 12),
                /*
              CustomButtonReversed(
                title: 'View My Order',
                height: 50,
                width: 240,
                pressed: (){},
                customColor: kLightGreyColor,
              )
              */
              ],
            ),
          )
      );
    }
    return Scaffold(
      body: Column(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
