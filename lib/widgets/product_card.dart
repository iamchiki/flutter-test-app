import 'package:flutter/material.dart';
import 'package:product_app/models/product.dart';
import 'package:product_app/screens/product_detail.dart';

class ProductCard extends StatelessWidget {
  // final String title;
  Product product;
  ProductCard(this.product);
  // ProductCard(this.title);

  void selectProduct(BuildContext ctx) {
    print('product');

    // Map<String, String> productMap = Map();
    print(product.images.runtimeType);
    // productMap['title'] = product.title;
    // productMap['description'] = product.description;
    // productMap['brand'] = product.brand;
    // productMap['category'] = product.category;
    // productMap['price'] = product.price.toString();
    // productMap['rating'] = product.rating.toString();

    // Navigator.of(ctx).pushNamed(ProductDetail.routeName,
    //     arguments: productMap as Map<String, Object>);
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
    print('print');
    // print(product.images);
    return InkWell(
      child: Card(
        child: Container(
          height: 150,
          // color: Colors.blue[100],
          child: Center(
            child: Text(
              product.title,
              style: TextStyle(
                color: Colors.blue[800],
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                // wordSpacing: 2,
              ),
            ),
          ),
          // child: Center(child: Text(title)),
        ),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.blue[100],
      ),
      onTap: () => selectProduct(context),
    );
  }
}
