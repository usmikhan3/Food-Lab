import 'package:flutter/material.dart';

class MyTextRow extends StatelessWidget {

  final String text1;
  final String text2;


  const MyTextRow({@required this.text1, @required this.text2, });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1 , style: TextStyle(fontSize: 16, color: Colors.white),),
        Text(text2 , style: TextStyle(fontSize: 16, color: Colors.black),)
      ],
    );
  }
}
