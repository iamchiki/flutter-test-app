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
    final String brand = routArgs['brand']!;
    final String category = routArgs['category']!;
    final String price = '1000';
    final String rating = '3';
    // final String price = routArgs['price']!;
    // final String rating = routArgs['rating']!;
    final String imgUrl = routArgs['imgUrl']!;
    print('images');
    print(imgUrl);
    print(imgUrl.runtimeType);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail changes'),
        toolbarHeight: 70,
      ),
      body: Align(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 350,
                child: Card(
                  child: Container(
                    child: Column(
                      children: [
                        Image.network(
                          imgUrl,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          child: Text(
                            productTitle!,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                        ),
                        Container(
                          child: Text(
                            description!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          margin: EdgeInsets.only(
                            bottom: 20,
                          ),
                        ),
                        Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 20)),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  UpdateProduct.routeName,
                                  arguments: {
                                    'title': productTitle,
                                    'description': description
                                  });
                            },
                            child: Text('Update'),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          margin: EdgeInsets.only(
                            bottom: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // color: Colors.blue[100],
                  color: Theme.of(context).primaryColorLight,
                  elevation: 10,
                ),
                margin: EdgeInsets.only(top: 30),
              ),
              Container(
                width: 350,
                child: Card(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Product Detail',
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
                            // color: Colors.blue[300],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Brand',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 1,
                                      ),
                                      top: BorderSide(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                                flex: 5,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(brand,
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorDark,
                                        fontSize: 17,
                                      )),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                                flex: 5,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Category',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 1,
                                      ),
                                      top: BorderSide(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                                flex: 5,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    category,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 17,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                                flex: 5,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Price',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 1,
                                      ),
                                      top: BorderSide(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                                flex: 5,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    price,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 17,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                                flex: 5,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text(
                                    'Rating',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 1,
                                      ),
                                      top: BorderSide(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                                flex: 5,
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    rating,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColorDark,
                                      fontSize: 17,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                                flex: 5,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(),
                        ),
                      ],
                    ),
                  ),
                  color: Theme.of(context).primaryColorLight,
                  elevation: 10,
                ),
                margin: EdgeInsets.only(top: 30, bottom: 30),
              ),
            ],
          ),
        ),
        alignment: Alignment.topCenter,
      ),
    );
  }
}
