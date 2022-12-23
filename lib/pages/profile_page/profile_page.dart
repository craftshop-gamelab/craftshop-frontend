import 'package:craftshop_indonesia/models/user_model.dart';
import 'package:craftshop_indonesia/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header(){
      return AppBar(
        backgroundColor: kBrandColor,
        toolbarHeight: 124,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(kDefaultMargin),
            child: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(user.profilePhotoUrl),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, ${user.name}',
                        style: kWhiteTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold
                        ),
                      ),
                      Text(
                        '@${user.username}',
                        style: kWhiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/sign-in');
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icon_exit.png')
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: kGreyTextStyle.copyWith(fontSize: 13),
            ),
            Icon(
              Icons.chevron_right,
              color: kGreyColor,
            ),
          ],
        ),
      );
    }
    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultMargin,
          ),
          decoration: BoxDecoration(
            // color: backgroundColor3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Account',
                style: kBlackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile-page-detail');
                },
                child: menuItem(
                  'Edit Profile',
                ),
              ),
              menuItem(
                'Your Orders',
              ),
              menuItem(
                'Help',
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'General',
                style: kBlackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              menuItem(
                'Privacy & Policy',
              ),
              menuItem(
                'Term of Service',
              ),
              menuItem(
                'Rate App',
              ),
            ],
          ),
        ),
      );
    }

    Widget contentStatic(){
      return Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
            child: Scaffold(
              backgroundColor: kWhiteColor,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account',
                        style: kGreyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold
                        ),
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/profile-detail-page');
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Edit Profile',
                                style: kGreyTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: regular
                                ),
                              ),
                            ),
                            Image.asset(
                              'assets/icon_back_reversed.png',
                              width: 12,
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 14),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Your Orders',
                              style: kGreyTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: regular
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/icon_back_reversed.png',
                            width: 12,
                            height: 10,
                          )
                        ],
                      ),
                      SizedBox(height: 14),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Help',
                              style: kGreyTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: regular
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/icon_back_reversed.png',
                            width: 12,
                            height: 10,
                          )
                        ],
                      ),
                    ],
                  ),

                  // NOTES : GENERAL MENU
                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'General',
                        style: kGreyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Privacy & Policy',
                              style: kGreyTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: regular
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/icon_back_reversed.png',
                            width: 12,
                            height: 10,
                          )
                        ],
                      ),
                      SizedBox(height: 14),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Term of Service',
                              style: kGreyTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: regular
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/icon_back_reversed.png',
                            width: 12,
                            height: 10,
                          )
                        ],
                      ),
                      SizedBox(height: 14),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Rate App',
                              style: kGreyTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: regular
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/icon_back_reversed.png',
                            width: 12,
                            height: 10,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          )
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        children: [
          header(),
          content(),
        ],
      ),
      // bottomNavigationBar: CustomBottomNavigation(profile: true),
    );
  }
}
