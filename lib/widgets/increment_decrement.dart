import 'package:flutter/material.dart';

class IncDec extends StatelessWidget {

  final IconData icon;

  const IncDec({@required this.icon});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: Colors.pink[100],
          borderRadius: BorderRadius.circular(10)
      ),
      child: Icon(icon),
    );
  }
}
