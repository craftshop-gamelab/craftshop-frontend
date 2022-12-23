import 'package:craftshop_indonesia/providers/auth_provider.dart';
import 'package:craftshop_indonesia/shared/theme.dart';
import 'package:craftshop_indonesia/widget/custom_button.dart';
import 'package:craftshop_indonesia/widget/custom_button_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class SignInPage extends StatefulWidget {

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    // NOTES : FUNCTIONS
    handleSignIn() async{

      setState(() {
        isLoading = true;
      });

      if(await authProvider.login(
          email: emailController.text,
          password: passwordController.text
      )){
         Navigator.pushNamed(context, '/main-page');
        // Navigator.pushReplacementNamed(context, '/main-page');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: kRedRemove,
                content: Container(
                  width: double.infinity,
                  height: 36,
                  child: Text(
                    'Sign In Failed',
                    textAlign: TextAlign.center,
                    style: kWhiteTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular
                    ),
                  ),
                )
            )
        );
      }

      setState(() {
        isLoading = false;
      });

    }

    // NOTES : UIs
    Widget header(){
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: kBlackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Register and Happy Shoping',
              style: kGreyTextStyle.copyWith(
                fontWeight: regular,
                fontSize: 14
              ),
            )
          ],
        ),
      );
    }
    Widget emailInput() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
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
                      'assets/icon_email.png',
                      width: 18,
                      height: 18,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                          controller: emailController,
                          style: kBlackTextStyle,
                          decoration: InputDecoration.collapsed(
                              hintText: 'Enter Your Email',
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
    Widget passwordInput() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
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
                      'assets/icon_password.png',
                      width: 18,
                      height: 18,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          style: kBlackTextStyle,
                          decoration: InputDecoration.collapsed(
                              hintText: 'Enter Your Password',
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
    Widget signUpRedirect(){
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account? ',
              style: kBlackTextStyle.copyWith(
                fontSize: 14
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text(
                'Sign Up',
                style: kPurpleTextStyle.copyWith(
                  fontWeight: bold
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(height: 64),
              emailInput(),
              SizedBox(height: 20),
              passwordInput(),
              SizedBox(height: 30),

              isLoading ?
              CustomButtonLoading(
                height: 50,
                customColor: kBrandColor,
                customFontWeight: medium,
              )
                  :
              CustomButton(
                title: 'Sign In',
                height: 50,
                pressed: () {
                  handleSignIn();
                },
                customColor: kBrandColor,
                customFontWeight: medium,
              ),

              Spacer(),
              signUpRedirect(),
            ],
          ),
        ),
      ),
    );
  }
}
