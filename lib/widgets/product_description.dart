import 'package:flutter/material.dart';
import 'package:groceryapp/constants/constants.dart';
import 'package:groceryapp/models/mgrocery.dart';

class Expandable extends StatefulWidget {

  final String title;
  final String description;
  final Widget trailing;

  Expandable({ this.title, this.description, this.trailing});

  @override
  _ExpandableState createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable> with SingleTickerProviderStateMixin {

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15.0,),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: kTitleStyle.copyWith(fontSize: 18.0),
              ),
              Spacer(),
              if(widget.trailing != null) widget.trailing,
              InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = ! _isExpanded;
                  });
                },
                child: RotatedBox(
                  quarterTurns: _isExpanded ? 3 : 0,
                  child: Icon(
                    Icons.chevron_right,
                  ),
                ),
              )
            ],
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 300),
            vsync: this,
            child: ConstrainedBox(
              constraints:
              _isExpanded ? BoxConstraints() : BoxConstraints(maxHeight: 0),
              child: Text(
                widget.description ?? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
