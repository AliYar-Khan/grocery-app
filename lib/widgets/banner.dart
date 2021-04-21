import 'package:flutter/material.dart';
import 'package:groceryapp/models/mq.dart';
import 'package:groceryapp/widgets/page_indicator.dart';

class BannerTab extends StatefulWidget {
  const BannerTab({
    Key key,
  }) : super(key: key);

  @override
  _BannerTabState createState() => _BannerTabState();
}

class _BannerTabState extends State<BannerTab> with SingleTickerProviderStateMixin {
  TabController _tabController;

  final List<Widget> banners = List.generate(
      3,
          (index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Image.asset(
          'assets/images/vegs_banner.png',
          fit: BoxFit.fill,
        ),
      ));

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: banners.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MQuery.height * 0.2,
      child: Stack(
        fit: StackFit.expand,
        children: [
          TabBarView(
            children: banners,
            controller: _tabController,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              width: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i=0; i< banners.length; i++)
                    PageIndicator(
                      index: i,
                      tabController: _tabController,
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}