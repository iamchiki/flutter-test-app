import 'package:flutter/material.dart';
import 'package:product_app/models/product.dart';
import 'package:product_app/screens/product_detail.dart';

class ProductCard extends StatelessWidget {
  // final String title;
  Product product;
  ProductCard(this.product);
  // ProductCard(this.title);
  void selectProduct(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(ProductDetail.routeName, arguments: {
      'title': product.title,
      'description': product.description
    });
    // Navigator.of(ctx)
    //     .pushNamed(ProductDetail.routeName, arguments: {'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 150,
        color: Colors.blue[100],
        child: Center(child: Text(product.title)),
        // child: Center(child: Text(title)),
      ),
      onTap: () => selectProduct(context),
    );
  }
}
