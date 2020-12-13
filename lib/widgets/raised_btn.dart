import 'package:flutter/material.dart';

class MyRaisedBtn extends StatelessWidget {

  final String name;
  final Color textColor;
  final Color color;
  final Function onTap;

  const MyRaisedBtn({@required this.name,this.textColor, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 200,
        child: RaisedButton(
          onPressed: onTap,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.orangeAccent
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          color:  color,
          child: Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: textColor),),
        )
    );
  }
}
