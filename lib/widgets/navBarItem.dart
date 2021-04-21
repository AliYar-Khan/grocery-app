import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/constants/constants.dart';

class NavBarItem extends StatefulWidget {

  final dynamic icon;
  final int index;
  final int activeIndex;
  final ValueChanged<int> onTabChanged;

  NavBarItem({this.icon, this.index,this.activeIndex,this.onTabChanged});

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      lowerBound: 1,
      upperBound: 1.3,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onTap () {
    if(widget.index != widget.activeIndex) {
      widget.onTabChanged(widget.index);
      _controller.forward().then((value) => _controller.reverse());
    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ScaleTransition(
            scale: _controller,
            child: SvgPicture.asset(
                widget.icon['icon'],
                color: widget.activeIndex == widget.index ? kPrimaryColor : null
            ),
          ),
          Text(
            widget.icon['title'],
            style: TextStyle(
              color: widget.activeIndex == widget.index ? kPrimaryColor : null,
            ),
          ),
        ],
      ),
    );
  }
}