import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_shop/provider/my_provider.dart';
import 'package:food_shop/widgets/increment_decrement.dart';
import 'package:provider/provider.dart';

import 'home.dart';




class CartScreen extends StatelessWidget {
  @override
  Widget cartItem({
    @required String name,
    @required String image,
    @required int price,
    @required int quantity,
  }){
    return Row(
      children: [
        Container(
          height: 180,
          width: 150,
          child: CircleAvatar(
            backgroundImage: NetworkImage(image),
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(name, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      Text("\R\s $price", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                      //TODO: COUNTER
                      Text("$quantity", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),


                IconButton(icon: Icon(Icons.close), onPressed: (){})
              ],
            )
        )
      ],
    );

  }
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return Scaffold(
     appBar: AppBar(
       elevation: 0,
       leading: IconButton(
         icon: Icon(Icons.arrow_back_ios),
         onPressed: () {
           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>HomePage()));
         },
       ),
     ),


      body:ListView.builder(
        itemCount: provider.cartList.length,
          itemBuilder:(ctx, index){
          return cartItem(
              name: provider.cartList[index].name,
              image: provider.cartList[index].image,
              price: provider.cartList[index].price,
              quantity: provider.cartList[index].quantity);
          }
      ),



      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepOrange[200],
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\R\s ${provider.totalPrice()}", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),),
            Text("Check Out", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),),

          ],
        ),
      ),
    );
  }
}
