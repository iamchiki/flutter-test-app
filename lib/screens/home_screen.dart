import 'package:flutter/material.dart';
import 'package:product_app/widgets/product_card.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Center(child: ProductCard()),
      child: Center(child: Text('home')),
    );
  }
}
