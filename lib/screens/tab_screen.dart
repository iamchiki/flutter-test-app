import 'package:flutter/material.dart';
import 'package:product_app/screens/home_screen.dart';
import 'package:product_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products App'),
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: TabBarView(
          children: <Widget>[Home()],
        ),
      ),
    );
  }
}
