// import 'package:flutter/material.dart';
// import 'package:food_shop/provider/my_provider.dart';
// import 'package:provider/provider.dart';
//
// class AddToCartBtn extends StatelessWidget {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     MyProvider provider = Provider.of<MyProvider>(context);
//     return Container(
//       height: 50,
//       width: MediaQuery.of(context).size.width,
//       child: RaisedButton(
//         color: Color(0xFFffcdd2),
//         onPressed: (){
//             provider.addToCart(
//                 image: image,
//                 name: name,
//                 price: price,
//                 quantity: 1);
//         },
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.add_shopping_cart),
//             SizedBox(width: 10,),
//             Text("Add To Cart", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
//           ],
//         ),
//       ),
//     );
//   }
// }
