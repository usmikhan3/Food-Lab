import 'package:flutter/material.dart';

class IncDec extends StatelessWidget {

  final IconData icon;
  final Color color;

  const IncDec({@required this.icon, @required this.color});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Icon(icon),
    );
  }
}
