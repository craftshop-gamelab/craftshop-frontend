import 'package:craftshop_indonesia/pages/cart_page/cart_page.dart';
import 'package:craftshop_indonesia/pages/chat_page/chat_page.dart';
import 'package:craftshop_indonesia/pages/favorite_products_page/favorite_product.dart';
import 'package:craftshop_indonesia/pages/home_page/home_page.dart';
import 'package:craftshop_indonesia/pages/profile_page/profile_page.dart';
import 'package:craftshop_indonesia/providers/page_provider.dart';
import 'package:craftshop_indonesia/widget/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shared/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget bottomNavs(){

      return BottomAppBar(
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: pageProvider.currentIndex,
            onTap: (value){
              pageProvider.currentIndex = value;
            },
            backgroundColor: kFieldGreyColor,
            items: [
              BottomNavigationBarItem(
                  icon : Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.only(top: 22, bottom: 8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: pageProvider.currentIndex == 0 ?  AssetImage('assets/nav_home_active.png') : AssetImage('assets/nav_home.png'),
                        )
                    ),
                  ),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon : Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.only(top: 22, bottom: 8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: pageProvider.currentIndex == 1 ? AssetImage('assets/nav_chat_active.png') : AssetImage('assets/nav_chat.png')
                        )
                    ),
                  ),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon : Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.only(top: 22, bottom: 8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: pageProvider.currentIndex == 2 ? AssetImage('assets/nav_cart_active.png') : AssetImage('assets/nav_cart.png')
                        )
                    ),
                  ),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon : Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.only(top: 22, bottom: 8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: pageProvider.currentIndex == 3 ? AssetImage('assets/nav_loved_active.png') : AssetImage('assets/nav_loved.png')
                        )
                    ),
                  ),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon : Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.only(top: 22, bottom: 8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: pageProvider.currentIndex == 4 ? AssetImage('assets/nav_profile_active.png') : AssetImage('assets/nav_profile.png')
                        )
                    ),
                  ),
                  label: ''
              ),
            ]
        ),
      );
    }
    Widget body(){
      switch (pageProvider.currentIndex) {
        case 0: return HomePage(); break;
        case 1: return ChatPage(); break;
        case 2: return CartPage(); break;
        case 3: return FavoriteProductsPage(); break;
        case 4: return ProfilePage(); break;
        default : return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: body(),
      bottomNavigationBar: bottomNavs(),
    );
  }
}
