import 'package:flutter/material.dart';
import 'package:product_app/screens/add_product.dart';
import 'package:product_app/screens/home_screen.dart';
import 'package:product_app/screens/prduct_list.dart';
import 'package:product_app/screens/product_detail.dart';
import 'package:product_app/screens/tab_screen.dart';
import 'package:product_app/screens/update_product.dart';

void main() => runApp(ProductApp());

class ProductApp extends StatelessWidget {
  // final globalTheme = ThemeData(
  //   primaryColorLight: Color.fromARGB(255, 197, 136, 130),
  //   primaryColorDark: Color.fromARGB(255, 143, 37, 21),
  //   textTheme: const TextTheme(
  //     bodyText2: TextStyle(
  //       color: Color.fromARGB(255, 143, 37, 21),
  //       fontSize: 20,
  //       fontWeight: FontWeight.w700,
  //       letterSpacing: 1,
  //     ),
  //     headline1: TextStyle(
  //       color: Color.fromARGB(255, 197, 136, 130),
  //       fontFamily: 'Allison',
  //       fontWeight: FontWeight.w700,
  //       fontSize: 20,
  //     ),
  //     headline2: TextStyle(
  //       color: Color.fromARGB(255, 143, 37, 21),
  //       fontFamily: 'Allison',
  //       fontWeight: FontWeight.w700,
  //       fontSize: 22,
  //     ),
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ButtonStyle(
  //       backgroundColor:
  //           MaterialStateProperty.all(Color.fromARGB(255, 143, 37, 21)),
  //       padding: MaterialStateProperty.all(
  //         EdgeInsets.all(15),
  //       ),
  //       textStyle: MaterialStateProperty.all(
  //         TextStyle(
  //           fontSize: 20,
  //           color: Color.fromARGB(255, 197, 136, 130),
  //         ),
  //       ),
  //     ),
  //   ),
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: Color.fromARGB(255, 217, 69, 56),
  //     elevation: 15,
  //     titleTextStyle: TextStyle(
  //       color: Color.fromARGB(255, 143, 37, 21),
  //       fontFamily: 'Allison',
  //       fontWeight: FontWeight.bold,
  //       fontSize: 20,
  //     ),
  //   ),
  // );

  final globalTheme = ThemeData(
    primaryColorLight: Color.fromARGB(255, 124, 174, 127),
    primaryColorDark: Color.fromARGB(255, 17, 80, 21),
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        color: Color.fromARGB(255, 17, 80, 21),
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 1,
      ),
      headline1: TextStyle(
        color: Color.fromARGB(255, 187, 228, 178),
        fontFamily: 'Allison',
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      headline2: TextStyle(
        color: Color.fromARGB(255, 17, 80, 21),
        fontFamily: 'Allison',
        fontWeight: FontWeight.w700,
        fontSize: 22,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 17, 80, 21)),
        padding: MaterialStateProperty.all(
          EdgeInsets.all(15),
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 185, 219, 176),
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 71, 232, 85),
      elevation: 15,
      titleTextStyle: TextStyle(
        color: Color.fromARGB(255, 17, 80, 21),
        fontFamily: 'Allison',
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products',
      theme: globalTheme,
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
