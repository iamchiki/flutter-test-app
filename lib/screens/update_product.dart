import 'package:flutter/material.dart';
import 'package:product_app/screens/home_screen.dart';
import 'package:product_app/screens/prduct_list.dart';
import 'package:product_app/widgets/main_drawer.dart';

class UpdateProduct extends StatefulWidget {
  static const routeName = '/update_product';
  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final productTitle = routArgs['title'];
    final description = routArgs['description'];
    return Scaffold(
      appBar: AppBar(title: Text('Update product')),
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
                    labelText: 'Product Name',
                    floatingLabelStyle: TextStyle(fontSize: 22),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product name';
                    }
                    return null;
                  },
                  initialValue: productTitle,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    // hintText: 'Enter Product Description',
                    labelText: 'Description',
                    floatingLabelStyle: TextStyle(fontSize: 22),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product description';
                    }
                    return null;
                  },
                  initialValue: description,
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
                    child: const Text('Update Product'),
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
