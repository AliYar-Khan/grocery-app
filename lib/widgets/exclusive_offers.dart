import 'package:flutter/material.dart';
import 'package:groceryapp/models/mgrocery.dart';
import 'package:groceryapp/models/mq.dart';
import 'package:groceryapp/widgets/grocery_item.dart';

class ExclusiveOffers extends StatelessWidget {

  final List<MGrocery> _items = [
    MGrocery(
      name: 'Organic Bananas',
      url: 'assets/images/bananas.png',
      description: '7pcs',
      price: 4.99,
    ),
    MGrocery(
      name: 'Red Apple',
      url: 'assets/images/apples.png',
      description: '1kg',
      price: 5.99,
    ),
    MGrocery(
      name: 'Red Pepper',
      url: 'assets/images/pepper.png',
      description: '1kg',
      price: 3.99,
    ),
    MGrocery(
      name: 'Red Apple',
      url: 'assets/images/apples.png',
      description: '1kg',
      price: 5.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MQuery.height * 0.3,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,),
        scrollDirection: Axis.horizontal,
          itemCount: _items.length,
          itemBuilder: (_,i) => GroceryItem(
            item: _items[i],
          ),
        separatorBuilder: (_,__) => SizedBox(
          width: 10.0,
        ),
      ),
    );
  }
}