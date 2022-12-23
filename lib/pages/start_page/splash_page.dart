import 'dart:async';
import 'package:craftshop_indonesia/pages/main_page.dart';
import 'package:craftshop_indonesia/providers/auth_provider.dart';
import 'package:craftshop_indonesia/providers/product_provider.dart';
import 'package:craftshop_indonesia/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){

    getInit();
    /*
    Timer(
        Duration(seconds: 3),
            ()=> Navigator.pushNamed(context, '/get-started')
    );
    */
    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
     Navigator.pushNamed(context, '/get-started');
    // Navigator.pushReplacementNamed(context, '/get-started');
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: kBrandColor,
      body: Center(
        child: Container(
          width: 185,
          height: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/a_splash_logo.png')
            )
          ),
        ),
      ),
    );
  }
}
