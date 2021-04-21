import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/constants/constants.dart';
import 'package:groceryapp/models/mgrocery.dart';
import 'package:groceryapp/widgets/custom_clipper.dart';
import 'package:groceryapp/widgets/item_detail_header.dart';
import 'package:groceryapp/widgets/item_details.dart';
import 'package:groceryapp/widgets/product_description.dart';

class ItemDetailsScreen extends StatefulWidget {
  static const routeName = 'item-details-screen/';

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  MGrocery item;
  bool _initLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_initLoading) {
      item = ModalRoute.of(context).settings.arguments as MGrocery;
      _initLoading = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(item: item),
              ItemDetails(item: item),
              SizedBox(
                height: 15.0,
              ),
              Divider(
                color: kBorderColor,
              ),
              Expandable(title: 'Product Details'),
              Divider(
                color: kBorderColor,
                indent: 15.0,
                endIndent: 15.0,
              ),
              Expandable(
                title: 'Nutritions',
                trailing: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kSecondaryColor,
                  ),
                  child: Text('100gr'),
                ),
              ),
              Divider(
                color: kBorderColor,
                indent: 15.0,
                endIndent: 15.0,
              ),
              Expandable(
                title: 'Reviews',
                trailing: Row(
                  children: List.generate(5, (index) => Icon(Icons.star, color: Colors.amber,size: 20.0,)),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  height: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: kTitleStyle.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


