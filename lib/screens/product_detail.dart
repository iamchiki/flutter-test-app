import 'package:flutter/material.dart';
import 'package:product_app/models/product.dart';
import 'package:product_app/screens/update_product.dart';
import 'package:product_app/widgets/product_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProductDetail extends StatelessWidget {
  static const routeName = '/product_detail';
  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final productTitle = routArgs['title'];
    final description = routArgs['description'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail changes'),
      ),
      body: Align(
        child: Container(
          width: 350,
          height: 300,
          child: Card(
            child: Container(
              child: Column(
                children: [
                  Text(
                    productTitle!,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    description!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.of(context).pushNamed(UpdateProduct.routeName,
                          arguments: {
                            'title': productTitle,
                            'description': description
                          });
                    },
                    child: Text('Update'),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
            ),
            color: Colors.blue[100],
            elevation: 10,
          ),
          margin: EdgeInsets.only(top: 30),
        ),
        alignment: Alignment.topCenter,
      ),
    );
  }
}
