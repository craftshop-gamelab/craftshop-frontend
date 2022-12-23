import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomBottomNavigation extends StatelessWidget {
  final bool home;
  final bool chat;
  final bool cart;
  final bool loved;
  final bool profile;

  const CustomBottomNavigation({
    Key key,
    this.home = false,
    this.chat = false,
    this.cart = false,
    this.loved = false,
    this.profile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 84,
      padding: EdgeInsets.all(32),
      color: kFieldGreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: home ? AssetImage('assets/nav_home_active.png') : AssetImage('assets/nav_home.png')
              )
            ),
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: chat ? AssetImage('assets/nav_chat_active.png') : AssetImage('assets/nav_chat.png')
                )
            ),
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: cart ? AssetImage('assets/nav_cart_active.png') : AssetImage('assets/nav_cart.png')
                )
            ),
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: loved ? AssetImage('assets/nav_loved_active.png') : AssetImage('assets/nav_loved.png')
                )
            ),
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: profile ? AssetImage('assets/nav_profile_active.png') : AssetImage('assets/nav_profile.png')
                )
            ),
          ),
        ],
      ),
    );
  }
}
