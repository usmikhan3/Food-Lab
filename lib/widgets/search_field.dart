import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search your favorite food",
            fillColor: Colors.white54,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30)
            )
        ),
      ),
    );
  }
}
