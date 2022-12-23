import 'package:flutter/material.dart';
import '../shared/theme.dart';

class CustomAddressCard extends StatelessWidget {
  const CustomAddressCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.only(top: 20),
      color: kFieldGreyColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address Details',
            style: kBlackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icon_store_address.png'),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 168,
                    child: Text(
                      'Store Location',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: kBlackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: light
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'San Diego Art, Tangerang',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: kBlackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 30,
            width: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_lineVertical.png'),
              )
            ),
          ),
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icon_your_address.png'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 168,
                    child: Text(
                      'Your Address',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: kBlackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: light
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Bumi Serpong Damai',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: kBlackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
