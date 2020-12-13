import 'package:flutter/material.dart';

class AddToCartBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        color: Color(0xFFffcdd2),
        onPressed: (){},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_shopping_cart),
            SizedBox(width: 10,),
            Text("Add To Cart", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
          ],
        ),
      ),
    );
  }
}
