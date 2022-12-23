import 'package:craftshop_indonesia/pages/cart_page/cart_page.dart';
import 'package:craftshop_indonesia/pages/cart_page/checkout_page.dart';
import 'package:craftshop_indonesia/pages/cart_page/checkout_success_page.dart';
import 'package:craftshop_indonesia/pages/chat_page/chat_page.dart';
import 'package:craftshop_indonesia/pages/chat_page/chat_page_detail.dart';
import 'package:craftshop_indonesia/pages/favorite_products_page/favorite_product.dart';
import 'package:craftshop_indonesia/pages/main_page.dart';
import 'package:craftshop_indonesia/pages/product_page/product_detail.dart';
import 'package:craftshop_indonesia/pages/profile_page/profile_detail_page.dart';
import 'package:craftshop_indonesia/pages/profile_page/profile_page.dart';
import 'package:craftshop_indonesia/pages/start_page/get_started_page.dart';
import 'package:craftshop_indonesia/pages/start_page/sign_in_page.dart';
import 'package:craftshop_indonesia/pages/start_page/sign_up_page.dart';
import 'package:craftshop_indonesia/pages/start_page/splash_page.dart';
import 'package:craftshop_indonesia/providers/auth_provider.dart';
import 'package:craftshop_indonesia/providers/cart_provider.dart';
import 'package:craftshop_indonesia/providers/page_provider.dart';
import 'package:craftshop_indonesia/providers/product_provider.dart';
import 'package:craftshop_indonesia/providers/transaction_provider.dart';
import 'package:craftshop_indonesia/providers/wishlist_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  /*
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseConfig.platformOptions
      );
  */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        )

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/main-page': (context) => MainPage(),
          // '/product-page-detail': (context) => ProductPage(),
          '/chat-page' : (context) => ChatPage(),
          // '/chat-page-detail': (context) => ChatPageDetail(),
          '/cart-page': (context) => CartPage(),
          '/checkout-page': (context) => CheckoutPage(),
          '/checkout-success-page': (context) => CheckoutSuccessPage(),
          '/fav-products-page': (context) => FavoriteProductsPage(),
          '/profile-page': (context) => ProfilePage(),
          '/profile-page-detail': (context) => ProfileDetailPage(),
        },
      ),
    );
  }
}
