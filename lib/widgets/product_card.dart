import 'package:flutter/material.dart';
import 'package:product_app/models/product.dart';
import 'package:product_app/screens/product_detail.dart';

class ProductCard extends StatelessWidget {
  Product product;
  ProductCard(this.product);

  void selectProduct(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(ProductDetail.routeName, arguments: {
      'title': product.title,
      'description': product.description,
      'brand': product.brand,
      'category': product.category,
      // 'price': product.price.toString(),
      // 'rating': product.rating.toString(),
      'imgUrl': product.images[0].toString()
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Container(
          height: 150,
          child: Center(
            child: Text(
              product.title,
              style: Theme.of(context).textTheme.bodyText2,
              // style: TextStyle(
              //   color: Colors.blue[800],
              //   fontSize: 20,
              //   fontWeight: FontWeight.w700,
              //   letterSpacing: 1,
              // ),
            ),
          ),
        ),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        // color: Colors.blue[100],
        color: Theme.of(context).primaryColorLight,
      ),
      onTap: () => selectProduct(context),
    );
  }
}
