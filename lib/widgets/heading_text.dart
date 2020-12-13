import 'package:flutter/material.dart';

class MyHeadingText extends StatelessWidget {

  final String text;
  final double size;
  final Color color;

  const MyHeadingText({@required this.text, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w800,
          color: color
      ),
    );
  }
}
