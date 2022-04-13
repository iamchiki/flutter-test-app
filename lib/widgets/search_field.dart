import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function(String)? inputChange;
  // String inputText;
  String text = '';

  SearchField(this.inputChange);
  TextEditingController searchController = TextEditingController();
  // TextEditingController searchController = TextEditingController(text: 'hello');
  void clearInput() {
    searchController.clear();
  }

  void inputHandler(inputText) {
    inputChange!(inputText);
  }

  @override
  Widget build(BuildContext context) {
    print('initialValue');
    // print(inputText);
    return FractionallySizedBox(
      // child: Container(
      child: TextFormField(
        // initialValue: 'inputText',
        textAlignVertical: TextAlignVertical.center,
        onChanged: inputHandler,
        style: TextStyle(fontSize: 18),
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search Porduct',
          filled: true,
          fillColor: Colors.white,
          // contentPadding: EdgeInsets.all(5),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          suffixIcon: IconButton(
            onPressed: clearInput,
            icon: Icon(
              Icons.clear,
              color: Colors.black,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // minLines: 1,
        // maxLines: 2,
      ),

      // padding: EdgeInsets.all(5),
      // margin: EdgeInsets.only(right: 25),
      // height: 40,
      //   color: Colors.black,
      // ),
      // heightFactor: 0.5,
      widthFactor: 0.9,
    );
  }
}
