import 'package:flutter/material.dart';
import 'package:craftshop_indonesia/widget/custom_button.dart';
import '../shared/theme.dart';

class CustomCheckoutButton extends StatelessWidget {
  const CustomCheckoutButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/checkout-success-page');
      },
      child: Container(
        height: 112,
        width: double.infinity,
        padding: EdgeInsets.only(right: kDefaultMargin,left: kDefaultMargin,bottom: 28, top: 28),
        child: Column(
          children: [
            CustomButton(
                height: 51,
                title: 'Checkout Now',
                customFontSize: 16,
                customFontWeight: semiBold,
                pressed: (){

                },
                customColor: kBrandColor
            )
          ],
        ),
      ),
    );
  }
}
