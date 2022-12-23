import 'package:craftshop_indonesia/models/product_model.dart';
import 'package:craftshop_indonesia/providers/wishlist_provider.dart';
import 'package:craftshop_indonesia/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../shared/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductPageStatic extends StatefulWidget {

  final ProductModel product;
  ProductPageStatic(this.product);

  @override
  State<ProductPageStatic> createState() => _ProductPageStaticState();
}

class _ProductPageStaticState extends State<ProductPageStatic> {
  final List images = [
    'assets/d_product_image.png',
    'assets/d_product_image.png',
    'assets/d_product_image.png',
  ];
  int currentIndex = 0;
  bool isLoved = false;

  // Constructor
  @override
  Widget build(BuildContext context) {
    int index = -1;
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    Widget header(){
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: kDefaultMargin,
              right: kDefaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Icon(Icons.chevron_left),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                Icon(Icons.shopping_bag),
              ],
            ),
          ),
        ],
      );
    }
    Widget indicatorImage(int index){
      return Container(
        width: currentIndex == index ? 18 : 6,
        height: 6,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? kBrandColor : kFieldGreyColor,
        ),
      );
    }
    Widget productImage(){
      return Stack(
        children: [
          Container(
            width: double.infinity,
            height: 458,
            child: CarouselSlider(
              items: images
                  .map(
                      (image) => Image.asset(
                        image,
                        width: MediaQuery.of(context).size.width,
                        height: 458,
                        fit: BoxFit.cover,
                      )
                  ).toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: (index, reason){
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  height: 478,
                  viewportFraction: 1
              ),
            ),
          ),
          Container(
            height: 860,
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.map((e){
                  index++;
                  return indicatorImage(index);
                }).toList()
            ),
          ),
        ],
      );
    }
    Widget productDetail(){
      return Container(
        margin: EdgeInsets.only(left: 30, right: 30, top: 474),
        //padding: EdgeInsets.only(left: 30, right: 30, top:20),
        child: Column(
          children: [
            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 250,
                      child: Text(
                        'Yena Abstract X3',
                        style: kBlackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Paintings',
                      style: kGreyTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){

                    setState(() {
                      isLoved = !isLoved;
                    });

                    if(isLoved){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: kGreenSuccess,
                              content: Container(
                                width: double.infinity,
                                height: 120,
                                child: Text(
                                  'Added to Favorite Products',
                                  textAlign: TextAlign.center,
                                  style: kWhiteTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: regular
                                  ),
                                ),
                              )
                          )
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: kRedRemove,
                              content: Container(
                                width: double.infinity,
                                height: 120,
                                child: Text(
                                  'Removed from Favorite Products',
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

                  },

                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                            isLoved ? AssetImage('assets/icon_loved_pink.png') : AssetImage('assets/icon_loved_white.png')
                        )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // price
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.all(16),
              color: kFieldGreyColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga',
                    style: kGreyTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 14
                    ),
                  ),
                  Text(
                    'IDR 1.400.000',
                    style: kCyanTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // description
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: kBlackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'This is a large sea canvas oil painting, hand-painted landscape sea art painting, white sea waves, texture painting, original art, summer sea, as a birthday gift, wedding gift, Christmas gift for friends, father\'s gift, mother\'s gift. Decorate coffee shop, bedroom, dining room, living room places.',
                  style: kGreyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: light
                  ),
                )
              ],
            ),
            SizedBox(height: 130),
          ],
        ),
      );
    }
    Widget buildContent(){
      return Scaffold(
        backgroundColor: kWhiteColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              productImage(),
              header(),
              productDetail(),
            ],
          ),
        ),
      );
    }

    Future<void> showSuccessDialog(){
      return showDialog(
          context: context,
          builder: (BuildContext context) => Container(
            width: MediaQuery.of(context).size.width - (2 * kDefaultMargin),
            child: AlertDialog(
              backgroundColor: kWhiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close,color: kGreyColor,
                          )
                      )
                    ),
                    Image.asset(
                      'assets/icon_success_check.gif',
                      width: 100,
                    ),
                    Text(
                      'Success',
                      style: kGreyTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      title: 'View Cart',
                      height: 44,
                      width: 140,
                      pressed: (){
                        Navigator.pushNamed(context, '/cart-page');
                      },
                      customFontSize: 16,
                      customColor: kCyanogen,
                      customFontWeight: medium,
                    )
                  ],
                ),
              ),
            ),
          )
      );
    }
    Widget OrderBottom(){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        width: double.infinity,
        height: 100,
        color: kWhiteColor,
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              padding: EdgeInsets.all(16),
              color: kFieldGreyColor,
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/icon_chat.png'
                      ),

                    )
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                pressed: (){
                  showSuccessDialog();
                },
                title: 'Add to Cart',
                height: 54,
                width: double.infinity,
                customFontSize: 16,
                customColor: kBrandColor,
                customFontWeight: medium,
              ),
            ),

          ],
        ),
      );
    }
    Widget orderNavigation(){
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          child: OrderBottom(),
        ),
      );
    }

    return SafeArea(
      child: Stack(
        children: [
          buildContent(),
          orderNavigation(),
        ],
      ),
    );
  }
}
