import 'package:flutter/material.dart';
import 'package:product_app/models/product.dart';
import 'package:product_app/widgets/main_drawer.dart';
import 'package:product_app/widgets/product_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:product_app/widgets/search_field.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductList extends StatefulWidget {
  static const routeName = '/product_list';
  // final String title;
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int currentPage = 0;
  String inputText = '';
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  List<Product> products = [];
  List<Product> productsList = [];
  Future<List<Product>> fetchAllProducts() async {
    var url =
        Uri.parse('https://dummyjson.com/products?limit=5&skip=$currentPage');
    try {
      var response = await http.get(url);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      for (var item in jsonResponse['products']) {
        Product product = Product(item['title'], item['description'],
            item['brand'], item['category'], item['images']);

        products.add(product);
      }
    } catch (e) {
      throw (e);
    }
    return products;
    // return productsList;
  }

  // fetch products based on search input texts
  Future<List<Product>> fetchProductsByQuery(String query) async {
    // products = [];
    List<Product> productsList = [];
    var url = Uri.parse('https://dummyjson.com/products/search?q=$query');
    try {
      var response = await http.get(url);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      for (var item in jsonResponse['products']) {
        Product product = Product(item['title'], item['description'],
            item['brand'], item['category'], item['images']);

        productsList.add(product);
      }
    } catch (e) {
      throw (e);
    }

    return productsList;
  }

  void _inputChange(String text) async {
    List<Product> result = await fetchProductsByQuery(text);
    setState(() {
      inputText = text;
      products = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SearchField(_inputChange),
          toolbarHeight: 70,
        ),
        drawer: MainDrawer(),
        body: Container(
          child: FutureBuilder(
            future:
                currentPage == 0 && inputText == '' ? fetchAllProducts() : null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot);

              if (inputText != '') {
                return Container(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: products.length,
                    // itemCount: 0,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(products[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                );
              }

              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                print(snapshot);
                return SmartRefresher(
                  controller: refreshController,
                  enablePullUp: true,
                  onLoading: () async {
                    currentPage += 5;
                    await fetchAllProducts();
                    refreshController.loadComplete();
                    setState(() {});
                  },
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    // itemCount: 0,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(snapshot.data[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                );
              }
            },
          ),
          padding: EdgeInsets.all(20),
        ));
  }
}
