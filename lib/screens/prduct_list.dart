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
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  List<Product> products = [];
  List<Product> productsList = [];
  Future<List<Product>> fetchAllProducts() async {
    // var url = Uri.parse('https://dummyjson.com/products');
    var url =
        Uri.parse('https://dummyjson.com/products?limit=5&skip=$currentPage');
    try {
      var response = await http.get(url);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      // print(jsonResponse);
      // jsonResponse['products'].forEach((product) => print(product.title));
      for (var item in jsonResponse['products']) {
        Product product = Product(item['title'], item['description']);
        products.add(product);
      }
      // productsList.addAll(products);
      // productsList = [...productsList, ...products];
      // products = jsonResponse['products'];
      // currentPage += 5;
      // setState(() {});
      print(jsonResponse['products']);
    } catch (e) {
      throw (e);
    }
    print('length');
    print(products.length);
    return products;
    // return productsList;
  }

  // fetch products based on search input texts
  Future<List<Product>> fetchProductsByQuery(String query) async {
    products = [];
    var url = Uri.parse('https://dummyjson.com/products/search?q=$query');
    try {
      var response = await http.get(url);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      for (var item in jsonResponse['products']) {
        Product product = Product(item['title'], item['description']);
        products.add(product);
      }
    } catch (e) {
      throw (e);
    }
    setState(() {});
    return products;
  }

  void _inputChange(String text) {
    print('input change handler');
    print(text);
    fetchProductsByQuery(text);
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SearchField(_inputChange),
        ),
        // appBar: AppBar(
        //   title: Container(
        //     child: TextField(
        //       style: TextStyle(backgroundColor: Colors.white),
        //     ),
        //     color: Colors.white,
        //     height: 20,
        //   ),
        // ),
        drawer: MainDrawer(),
        body: Container(
          child: FutureBuilder(
            future: fetchAllProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot);
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
                    final result = await fetchAllProducts();
                    refreshController.loadComplete();
                    setState(() {
                      currentPage += 5;
                    });
                  },
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    // itemCount: 0,
                    itemBuilder: (BuildContext context, int index) {
                      // return ListTile(
                      //   title: Text(snapshot.data[index].title),
                      // );
                      return ProductCard(snapshot.data[index]);
                      // return ProductCard(snapshot.data[index].title);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                );
                // return ListView.separated(
                //   padding: const EdgeInsets.all(8),
                //   itemCount: snapshot.data.length,
                //   // itemCount: 0,
                //   itemBuilder: (BuildContext context, int index) {
                //     // return ListTile(
                //     //   title: Text(snapshot.data[index].title),
                //     // );
                //     return ProductCard(snapshot.data[index]);
                //     // return ProductCard(snapshot.data[index].title);
                //   },
                //   separatorBuilder: (BuildContext context, int index) =>
                //       const Divider(),
                // );
              }
            },
          ),
          padding: EdgeInsets.all(20),
        ));
  }
}

// class ProductList extends StatelessWidget {
//   static const routeName = '/product_list';
//   final List<String> entries = <String>[
//     'A',
//     'B',
//     'C',
//   ];
//   final List<int> colorCodes = <int>[600, 500, 100];

//   List<dynamic> products = [];

//   void fetchAllProducts() async {
//     var url = Uri.parse('https://dummyjson.com/products');
//     try {
//       var response = await http.get(url);
//       var jsonResponse =
//           convert.jsonDecode(response.body) as Map<String, dynamic>;
//       // print(jsonResponse);
//       products = jsonResponse['products'];
//       print(products);
//     } catch (e) {
//       throw (e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     fetchAllProducts();
//     return Scaffold(
//       appBar: AppBar(title: Text('Product List')),
//       drawer: MainDrawer(),
//       body: ListView.separated(
//         padding: const EdgeInsets.all(8),
//         itemCount: entries.length,
//         // itemCount: products.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ProductCard();
//           // return Container(
//           //   height: 50,
//           //   color: Colors.blue[100],
//           //   child: Center(child: Text('Entry ${entries[index]}')),
//           // );
//         },
//         separatorBuilder: (BuildContext context, int index) => const Divider(),
//       ),
//       // body: Center(
//       //   child: ProductCard(),
//       // ),
//     );
//   }
// }
