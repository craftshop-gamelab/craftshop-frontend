import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color customColor;
  final FontWeight customFontWeight;
  final double customFontSize;
  final Function() pressed;
  final EdgeInsets margin;

  const CustomButton({
    Key key,
    this.title = 'customText',
    this.width = double.infinity,
    this.height = 64,
    this.customFontWeight,
    this.customFontSize = 18,
    this.pressed,
    this.customColor,
    this.margin = EdgeInsets.zero
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,

      child: TextButton(
        onPressed: pressed,
        style: TextButton.styleFrom(
          backgroundColor: customColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0)
          ),
        ),
        child: Text(
          title,
          style: kWhiteTextStyle.copyWith(
            fontSize: customFontSize,
            fontWeight: customFontWeight,
          ),
        ),
      ),
    );
  }
}
