import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/constants/constants.dart';
import 'package:groceryapp/models/mgrocery.dart';
import 'package:groceryapp/widgets/custom_clipper.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.item,
  }) : super(key: key);

  final MGrocery item;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: ClipPath(
        clipper: MyClipper(),
        child: Container(
            padding: const EdgeInsets.only(
                left: 10.0, top: 20.0, right: 15.0, bottom: 20.0),
            decoration: BoxDecoration(
              color: kSecondaryColor,
            ),
            child: LayoutBuilder(
              builder: (_, constraints) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => {
                            Navigator.of(context).pop(),
                          },
                          child: Icon(
                            Icons.chevron_left,
                            color: kBlackColor,
                            size: 30.0,
                          ),
                        ),
                        SvgPicture.asset('assets/icons/share.svg'),
                      ],
                    ),
                    Hero(
                      tag: item.hashCode,
                      child: Image.asset(
                        item.url,
                        width: constraints.maxWidth * 0.65,
                        height: constraints.maxHeight * 0.6,
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}