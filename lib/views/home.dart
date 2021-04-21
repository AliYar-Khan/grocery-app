import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceryapp/views/shop_screen.dart';
import 'package:groceryapp/widgets/navBar.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final List _tabIcons = List.unmodifiable([
    {'icon': 'assets/icons/shop.svg', 'title' : 'Shop'},
    {'icon': 'assets/icons/explore.svg', 'title' : 'Explore'},
    {'icon': 'assets/icons/cart.svg', 'title' : 'Cart'},
    {'icon': 'assets/icons/favorite.svg', 'title' : 'Favorite'},
    {'icon': 'assets/icons/account.svg', 'title' : 'Account'},
  ]);

  final List<Widget> _tabs = List.unmodifiable([
    ShopScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ]);

  void onChangeTab(int index) {
    setState(() =>
      currentIndex = index
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[currentIndex],
      bottomNavigationBar: NavBar(tabIcons: _tabIcons, activeIndex: currentIndex,onTabChanged: onChangeTab,),
    );
  }
}