import 'package:craftshop_indonesia/shared/theme.dart';
import 'package:craftshop_indonesia/widget/custom_button.dart';
import 'package:craftshop_indonesia/widget/custom_button_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class SignUpPage extends StatefulWidget {

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async{

      setState(() {
        isLoading = true;
      });

      if(await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
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
                    'Registration Failed',
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

    // NOTES : UI WIDGET
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
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
    Widget nameInput() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
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
                      'assets/icon_profile.png',
                      width: 18,
                      height: 18,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                          controller: nameController,
                          style: kBlackTextStyle,
                          decoration: InputDecoration.collapsed(
                              hintText: 'Enter Your Name',
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
    Widget usernamelInput() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
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
                      'assets/icon_username.png',
                      width: 18,
                      height: 18,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                          controller: usernameController,
                          style: kBlackTextStyle,
                          decoration: InputDecoration.collapsed(
                              hintText: 'Enter Your Username',
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
                          style: kBlackTextStyle,
                          controller: emailController,
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
    Widget loginRedirect() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              style: kBlackTextStyle.copyWith(
                  fontSize: 14
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/sign-in');
              },
              child: Text(
                'Sign In',
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
              nameInput(),
              SizedBox(height: 20),
              usernamelInput(),
              SizedBox(height: 20),
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
                title: 'Sign Up',
                height: 50,
                pressed: () {
                  handleSignUp();
                },
                customColor: kBrandColor,
                customFontWeight: medium,
              ),

              Spacer(),
              loginRedirect(
              ),
            ],
          ),
        ),
      ),
    );
  }
}
