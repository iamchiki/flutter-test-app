import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function(String)? inputChange;

  SearchField(this.inputChange);
  TextEditingController searchController = TextEditingController();
  void clearInput() {
    searchController.clear();
  }

  void inputHandler(inputText) {
    inputChange!(inputText);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        // textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        onChanged: inputHandler,
        style: TextStyle(fontSize: 18),
        controller: searchController,
        decoration: InputDecoration(
            hintText: 'Search Porduct',
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(5),
            suffixIcon: IconButton(
                onPressed: clearInput,
                icon: Icon(
                  Icons.clear,
                  color: Colors.black,
                ))),
      ),
      // padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(right: 25),
      // height: 40,
    );
  }
}
