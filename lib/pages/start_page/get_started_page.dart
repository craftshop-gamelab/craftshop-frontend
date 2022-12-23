import 'package:craftshop_indonesia/shared/theme.dart';
import 'package:craftshop_indonesia/widget/custom_button.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 448,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/b_getstarted_image.png')
                    )
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 52),
                    Text(
                      'Let\'s Find \nWonders',
                      style: kBlackTextStyle.copyWith(
                        fontSize: 34,
                        fontWeight: extrabold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Welcome to craftshop, Find authentic \namazing works & wicked things',
                      style: kGreyTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 46),
                    CustomButton(
                      title: 'Get Started',
                      height: 50,
                      width: 150,
                      pressed: (){
                        Navigator.pushNamed(context, '/sign-in');
                        // Navigator.pushReplacementNamed(context, '/sign-in');
                      },
                      customColor: kBrandColor,
                      customFontWeight: medium,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
