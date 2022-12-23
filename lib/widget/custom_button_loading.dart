import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomButtonLoading extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color customColor;
  final FontWeight customFontWeight;
  final double customFontSize;
  final Function() pressed;
  final EdgeInsets margin;

  const CustomButtonLoading({
    Key key,
    this.title = 'Loading...',
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
        onPressed: (){},
        style: TextButton.styleFrom(
          backgroundColor: customColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0)
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
               child: CircularProgressIndicator(
                 strokeWidth: 2,
                 valueColor: AlwaysStoppedAnimation(kWhiteColor),
               )
            ),
            SizedBox(width: 6),
            Text(
              title,
              style: kWhiteTextStyle.copyWith(
                fontSize: customFontSize,
                fontWeight: customFontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
