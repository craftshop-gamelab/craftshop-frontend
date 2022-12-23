import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomCartCardStatic extends StatefulWidget {

  const CustomCartCardStatic({Key key}) : super(key: key);

  @override
  State<CustomCartCardStatic> createState() => _CustomCartCardStaticState();
}

class _CustomCartCardStaticState extends State<CustomCartCardStatic> {
  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter(){
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      color: kFieldGreyColor,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // THUMBNAIL, TITLE & PRICE
          Row(
            children: [
              //THUMBNAIL
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/c_home_image1.png'),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/icon_delete.png'),
                            )
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Remove',
                        style: kRedTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(width: 12),

              // TITTLE & PRICE
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // TITLE
                  SizedBox(height: 6),
                  Container(
                    width: 180,
                    child: Text(
                      'Terrex Urban Low',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kBlackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold
                      ),
                    ),
                  ),

                  //PRICE
                  SizedBox(height: 2),
                  Text(
                    'IDR 1.400.000',
                    style: kCyanTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),

          //COUNTER
          Column(
            children: [
              SizedBox(height: 16),
              GestureDetector(
                onTap: (){
                  _incrementCounter();
                },
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icon_increment.png')
                      )
                  ),
                ),
              ),
              SizedBox(height: 3),
              Text(
                '$_counter',
                style: kBlackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium
                ),
              ),
              SizedBox(height: 3),
              GestureDetector(
                onTap: (){
                  _decrementCounter();
                },
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/icon_decrement.png')
                      )
                  ),
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}
