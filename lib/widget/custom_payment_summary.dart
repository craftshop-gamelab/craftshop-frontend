import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomPaymentSummary extends StatelessWidget {
  const CustomPaymentSummary({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  '2 Items',
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
                  'IDR 1.400.000',
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
                  'IDR 2.800.000',
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
    );
  }
}
