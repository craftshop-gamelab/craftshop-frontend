import 'package:craftshop_indonesia/models/message_model.dart';
import 'package:craftshop_indonesia/models/product_model.dart';
import 'package:craftshop_indonesia/pages/chat_page/chat_page_detail.dart';
import 'package:flutter/material.dart';
import '../shared/theme.dart';

class ChatTile  extends StatelessWidget {

  final MessageModel message;
  ChatTile(this.message);

  /*
  final String thumbnail;
  final String username;

  const ChatTile ({
    Key key,
    this.thumbnail = 'assets/icon_profile_default.png',
    this.username = 'craftshop user',
  }) : super(key: key);
  */

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Navigator.pushNamed(context, '/chat-page-detail');
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPageDetail(UninitializedProductModel(),),),);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 18),
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/random_image4.png')
                )
              ),
            ),
            SizedBox( width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CS : Salsa',
                    style: kBlackTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: regular
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    message.message,
                    style: kGreyTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: light
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Text('Now',style: kGreyTextStyle.copyWith(fontSize: 12, fontWeight: regular))
          ],
        ),
      ),
    );
  }
}
