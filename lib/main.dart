import 'package:flutter/material.dart';
import 'package:product_app/screens/add_product.dart';
import 'package:product_app/screens/home_screen.dart';
import 'package:product_app/screens/prduct_list.dart';
import 'package:product_app/screens/product_detail.dart';
import 'package:product_app/screens/tab_screen.dart';
import 'package:product_app/screens/update_product.dart';

void main() => runApp(ProductApp());

class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        ProductDetail.routeName: (ctx) => ProductDetail(),
        ProductList.routeName: (ctx) => ProductList(),
        AddProduct.routeName: (ctx) => AddProduct(),
        Home.routeName: (ctx) => Home(),
        UpdateProduct.routeName: (ctx) => UpdateProduct(),
      },
    );
  }
}
