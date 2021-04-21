import 'package:flutter/material.dart';
import 'package:groceryapp/constants/constants.dart';

class PageIndicator extends StatefulWidget {
  final int index;
  final TabController tabController;

  PageIndicator({this.index,this.tabController});

  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {

  bool expanded;

  @override
  void initState() {
    super.initState();
    expanded = widget.index == widget.tabController.index;
    widget.tabController.addListener(() {
      setState(() {
        expanded = widget.index == widget.tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: expanded ? 15.0 : 5.0,
      height: 5.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: expanded ? kPrimaryColor : Colors.grey,
      ),
    );
  }
}
