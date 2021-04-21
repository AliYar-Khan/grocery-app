import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/constants/constants.dart';
import 'package:groceryapp/models/mgrocery.dart';

class ItemDetails extends StatelessWidget {
  final MGrocery item;

  ItemDetails({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15.0,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style: kTitleStyle.copyWith(fontSize: 18.0),
              ),
              SvgPicture.asset(
                'assets/icons/favorite.svg',
                color: kBlackColor.withOpacity(0.7),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            item.description,
            style: kDescriptionStyle,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Icon(
                Icons.horizontal_rule,
                color: kBlackColor.withOpacity(0.7),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: kBorderColor),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  '1',
                  style: kTitleStyle,
                ),
              ),
              Icon(
                Icons.add,
                color: kPrimaryColor,
              ),
              Spacer(),
              Text(
                '\$${item.price}',
                style: kTitleStyle.copyWith(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}
