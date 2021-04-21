import 'package:flutter/material.dart';
import 'package:groceryapp/views/home.dart';
import 'package:groceryapp/views/item_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Map<String,Widget Function(BuildContext )> routes = {
    ItemDetailsScreen.routeName: (_) => ItemDetailsScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }

}


