import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/constants/constants.dart';
import 'package:groceryapp/models/mq.dart';
import 'package:groceryapp/widgets/best_sellings.dart';
import 'package:groceryapp/widgets/exclusive_offers.dart';
import 'package:groceryapp/widgets/groceries.dart';
import 'package:groceryapp/widgets/meats.dart';
import 'package:groceryapp/widgets/search_field.dart';
import 'package:groceryapp/widgets/banner.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    MQuery().init(context);
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0,),
          child: Column(
            children: [
              SvgPicture.asset('assets/icons/carrot.svg'),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Istanbul, Levent',
              ),
              SizedBox(
                height:10.0,
              ),
              SearchField(),
              SizedBox(
                height: 10.0,
              ),
              BannerTab(),
              SizedBox(
                height: 10.0,
              ),
              _buildSectionTile('Exclusive Offers' , () {}),
              ExclusiveOffers(),
              SizedBox(
                height: 10.0,
              ),
              _buildSectionTile('Best Selling' , () {}),
              BestSelling(),
              SizedBox(
                height: 10.0,
              ),
              _buildSectionTile('Groceries' , () {}),
              Groceries(),
              SizedBox(
                height: 10.0,
              ),
              _buildSectionTile('Meat' , () {}),
              Meats(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTile(String title, [Function onTap]) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: kTitleStyle.copyWith(fontSize: 18.0),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              'See all',
              style: TextStyle(
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

