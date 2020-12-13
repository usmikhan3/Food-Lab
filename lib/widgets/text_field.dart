import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final String hintText;
  final Color textColor;
  final Color sideColor;
  final IconData icon;
  final bool isObscureText;
  final TextEditingController controller;


  MyTextField({@required this.hintText, this.textColor, this.sideColor, this.icon, this.isObscureText,@required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            hintStyle: TextStyle(color: textColor),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: sideColor
                )
            )
        )
    );
  }
}
