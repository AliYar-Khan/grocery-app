import 'package:flutter/material.dart';
import 'package:groceryapp/constants/constants.dart';
import 'package:groceryapp/models/mgrocery.dart';
import 'package:groceryapp/models/mq.dart';
import 'package:groceryapp/views/item_details_screen.dart';

class GroceryItem extends StatelessWidget {
  final MGrocery item;

  GroceryItem({this.item});

  void OnClickItem(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(ItemDetailsScreen.routeName,arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => OnClickItem(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        width: MQuery.width * 0.4,
        decoration: BoxDecoration(
          border: Border.all(
            color: kBorderColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: item.hashCode,
                  child: Image.asset(
                    item.url,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  item.name,
                  style: kTitleStyle,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  item.description,
                  style: kDescriptionStyle,
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${item.price}',
                      style: kTitleStyle.copyWith(fontWeight: FontWeight.w700),
                    ),
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
