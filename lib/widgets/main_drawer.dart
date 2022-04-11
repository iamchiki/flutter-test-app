import 'package:flutter/material.dart';
import 'package:product_app/screens/add_product.dart';
import 'package:product_app/screens/home_screen.dart';
import 'package:product_app/screens/prduct_list.dart';

class MainDrawer extends StatelessWidget {
  void tapHandler(BuildContext ctx) {
    // Navigator.of(ctx).pushNamed(Home().routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.blue[100],
            child: Text('Menu',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Colors.blue[900])),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              // Navigator.of(context).pushNamed(Home.routeName);
            },
          ),
          ListTile(
            title: Text('All Prodcuts'),
            onTap: () {
              Navigator.of(context).pushNamed(ProductList.routeName);
            },
          ),
          ListTile(
            title: Text('Add Product'),
            onTap: () {
              Navigator.of(context).pushNamed(AddProduct.routeName);
            },
          ),
        ],
      ),
    );
  }
}
