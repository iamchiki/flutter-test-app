import 'package:flutter/material.dart';
import 'package:product_app/screens/home_screen.dart';
import 'package:product_app/screens/prduct_list.dart';
import 'package:product_app/widgets/main_drawer.dart';

class AddProduct extends StatefulWidget {
  static const routeName = '/add_product';
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add product'),
        toolbarHeight: 70,
        // backgroundColor: Theme.of(context).backgroundColor,
      ),
      drawer: MainDrawer(),
      body: Align(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                      // hintText: 'Enter Product Name',
                      labelText: 'Product Name'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      // hintText: 'Enter Product Description',
                      labelText: 'Description '),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product description';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        // Process data.
                        Navigator.of(context).pushNamed(ProductList.routeName);
                      }
                    },
                    child: const Text('Add Product'),
                  ),
                ),
              ],
            ),
          ),
          padding: EdgeInsets.all(20),
          // color: Colors.blue[100],
          height: 400,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
