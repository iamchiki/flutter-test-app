import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function(String)? inputChange;
  final String text = '';

  SearchField(this.inputChange);
  final TextEditingController searchController = TextEditingController();
  void clearInput() {
    searchController.clear();
  }

  void inputHandler(inputText) {
    inputChange!(inputText);
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        onChanged: inputHandler,
        style: TextStyle(fontSize: 18),
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search Porduct',
          filled: true,
          fillColor: Colors.white,
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
      ),
      widthFactor: 0.9,
    );
  }
}
