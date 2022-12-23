import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomInput1 extends StatelessWidget {
  final String label;
  final String hintText;
  final String customIcon;
  final double iconHeight;
  final double iconWidth;

  const CustomInput1({
    Key key,
    this.label,
    this.hintText,
    this.customIcon,
    this.iconHeight,
    this.iconWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: kBlackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kFieldGreyColor
            ),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    customIcon,
                    width: iconWidth,
                    height: iconHeight,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                      child: TextFormField(
                        style: kBlackTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: hintText,
                          hintStyle: kGreyTextStyle.copyWith(
                            fontSize: 14
                          )
                        ),
                    )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
