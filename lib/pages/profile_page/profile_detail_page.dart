import 'package:craftshop_indonesia/models/user_model.dart';
import 'package:craftshop_indonesia/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/theme.dart';

class ProfileDetailPage extends StatelessWidget {
  const ProfileDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    PreferredSize header(){
      return PreferredSize(
          child: SafeArea(
            child: AppBar(
              backgroundColor: kBrandColor,
              centerTitle: true,
              elevation: 0,
              automaticallyImplyLeading: true,
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.check, color: kWhiteColor,)),
                SizedBox(width: 30)
              ],
              title: Text(
                'Edit Profile',
                style: kWhiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(88)
      );
    }
    Widget nameInput(){
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: kBlackTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: user.name,
                hintStyle: kBlackTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: regular
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: kFieldGreyColor
                    )
                ),
              ),
            )
          ],
        ),
      );
    }
    Widget usernameInput(){
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: kBlackTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: '@${user.username}',
                hintStyle: kBlackTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: regular
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: kFieldGreyColor
                    )
                ),
              ),
            )
          ],
        ),
      );
    }
    Widget emaiInput(){
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: kBlackTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: '${user.email}',
                hintStyle: kBlackTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: regular
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: kFieldGreyColor
                    )
                ),
              ),
            )
          ],
        ),
      );
    }
    Widget content(){
      return Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: kDefaultMargin, left: kDefaultMargin,right: kDefaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(user.profilePhotoUrl)
                  )
              ),
            ),
            nameInput(),
            usernameInput(),
            emaiInput()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: header(),
      body: content(),
    );
  }
}
