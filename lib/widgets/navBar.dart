import 'package:flutter/material.dart';
import 'package:groceryapp/constants/constants.dart';
import 'package:groceryapp/widgets/navBarItem.dart';

class NavBar extends StatelessWidget {

  final List tabIcons;
  final int activeIndex;
  final ValueChanged<int> onTabChanged;
  NavBar({this.tabIcons,this.activeIndex,this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0,0),
            color: kShadowColor.withOpacity(0.14),
            blurRadius: 25.0,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i=0; i< tabIcons.length; i++)
              NavBarItem(
                  icon: tabIcons[i],
                  index: i,
                  activeIndex: activeIndex,
                  onTabChanged: onTabChanged
              ),
          ],
      ),
    );
  }
}

