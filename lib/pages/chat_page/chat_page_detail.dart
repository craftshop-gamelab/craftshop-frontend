import 'package:craftshop_indonesia/models/message_model.dart';
import 'package:craftshop_indonesia/providers/auth_provider.dart';
import 'package:craftshop_indonesia/models/product_model.dart';
import 'package:craftshop_indonesia/services/message_service.dart';
import 'package:craftshop_indonesia/widget/custom_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/theme.dart';

class ChatPageDetail extends StatefulWidget {
  ProductModel product;
  ChatPageDetail(this.product);

  @override
  State<ChatPageDetail> createState() => _ChatPageDetailState();
}

class _ChatPageDetailState extends State<ChatPageDetail> {

  TextEditingController messageController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    // NOTES : FUNCTION
    handleAddMessage() async {
      await MessageService().addMessage(
        user: authProvider.user,
        isFromUser: true,
        product: widget.product,
        message: messageController.text,
      );

      setState(() {
        widget.product = UninitializedProductModel();
        messageController.text = '';
      });
    }

    // NOTES : CUSTOM WIDGET
    PreferredSize header(){
      return PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          backgroundColor: kBrandColor,
          toolbarHeight: 90,
          centerTitle: false,
          title: Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: AssetImage('assets/icon_profile_default.png'),
                        fit: BoxFit.cover
                    )
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/icon_online.png')
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CS 4 : Salsa',
                    style: kWhiteTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: medium
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Online',
                    style: kWhiteTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: light
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
    Widget productPreview(){
      return Container(
        height: 74,
        width: 230,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
        color: kFieldGreyColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.product.galleries[0].url),
                  fit: BoxFit.cover
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 2,bottom: 2),
                  width: 110,
                  child: Text(
                    widget.product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: kBlackTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 15
                    ),
                  ),
                ),
                Text(
                  'IDR ${widget.product.price}',
                  style: kCyanTextStyle.copyWith(
                    fontWeight: medium
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  widget.product = UninitializedProductModel();
                });
              },
              child: Container(
                height: 22,
                width: 22,
                margin: EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icon_exit_black.png')
                  )
                ),
              ),
            )
          ],
        ),
      );
    }
    Widget chatInput(){
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.product is UninitializedProductModel ? SizedBox(height: 1) : productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: kFieldGreyColor
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: messageController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type message...',
                          hintStyle: kGreyTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: handleAddMessage,
                  child: Image.asset(
                    'assets/icon_send_button.png',
                    width: 45,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }
    Widget content(){
      return StreamBuilder<List<MessageModel>>(
        stream: MessageService().getMessagesByUserId(userId: authProvider.user.id),
        builder: (context, snapshot) {

          if(snapshot.hasData){
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: kDefaultMargin),
              children: snapshot.data
                  .map(
                      (MessageModel message) => ChatBubble(
                        isSender: message.isFromUser,
                        text: message.message,
                        product: message.product,
                      )
                      )
                  .toList()

              /* [
                ChatBubble(isSender: true, text: 'Good Morning',),
                ChatBubble(isSender: true, text: 'Hi, This item is still available?',),
                ChatBubble(isSender: false, text: 'Good Morning, This item is only 3 paintings left',),
                ChatBubble(isSender: true, text: 'Ok, I buy 4',),
              ] */
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }

        }
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
