import 'package:craftshop_indonesia/providers/auth_provider.dart';
import 'package:craftshop_indonesia/models/message_model.dart';
import 'package:craftshop_indonesia/providers/page_provider.dart';
import 'package:craftshop_indonesia/services/message_service.dart';
import 'package:craftshop_indonesia/widget/custom_bottom_navigation.dart';
import 'package:craftshop_indonesia/widget/custom_button.dart';
import 'package:craftshop_indonesia/widget/custom_chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/theme.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget header(){
      return AppBar(
        backgroundColor: kBrandColor,
        centerTitle: true,
        toolbarHeight: 90,
        title: Text(
          'Message Support',
          style: kWhiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,

          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }
    Widget empty(){
      return Expanded(
          child: Container(
            color: kWhiteColor,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon_headset.png',
                  width: 80,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Ops.. No Message Yet',
                  style: kBlackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'start hitting our professional sellers' ,
                  style: kGreyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
                SizedBox(height: 16),
                CustomButton(
                  title: 'Explore Store',
                  height: 50,
                  width: 150,
                  pressed: (){
                    pageProvider.currentIndex = 0;
                  },
                  customColor: kBrandColor,
                  customFontWeight: medium,
                )
              ],
            ),
          )
      );
    }
    Widget content(){
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService().getMessagesByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {

            if (snapshot.hasData){

              if(snapshot.data.length == 0){
                return empty();
              }

              return Expanded(
                  child: Container(
                      color: kWhiteColor,
                      width: double.infinity,
                      child: ListView(
                        padding: EdgeInsets.only(right: kDefaultMargin, left: kDefaultMargin, top: kDefaultMargin),
                        children:

                        [ /*
                          ChatTile(thumbnail: 'assets/random_image4.png', username: 'Salsa Zakaria',),
                          ChatTile(thumbnail: 'assets/random_image1.png', username: 'Rosio Montonya',),
                          ChatTile(thumbnail: 'assets/random_image2.png', username: 'Karina Aespa',),
                          ChatTile(thumbnail: 'assets/random_image3.png', username: 'Winter Armormentor',),
                          */
                          ChatTile(snapshot.data[snapshot.data.length - 1]),
                        ],
                      )
                  )
              );
            } else {
              return empty();
            }


          }
      );
    }

    return Scaffold(
      body: Column(
        children: [
          header(),
          content(),
        ],
      ),
      // bottomNavigationBar: CustomBottomNavigation(chat: true),
    );
  }
}
