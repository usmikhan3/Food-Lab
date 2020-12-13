import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_shop/widgets/add_to_cart_btn.dart';
import 'package:food_shop/widgets/food_detail_image_container.dart';
import 'package:food_shop/widgets/increment_decrement.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [


          //TODO: IMAGE CONTAINER
          Expanded(
              child: FoodImageContainer(image: "assets/images/2.png",)
          ),

          //TODO: DESCRIPTION CONTAINER
          Expanded(
              flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Jumbo Burger",
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),
                    Text("Any Text",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IncDec(icon: Icons.remove),
                            SizedBox(width: 10,),
                            Text("1", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
                            SizedBox(width: 10,),
                            IncDec(icon: Icons.add),
                          ],
                        ),
                        Text("\R\s 350", style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),)
                      ],
                    ),

                    Text("Description",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500) ),

                    Text("Below is a sample of “Lorem ipsum dolor sit” dummy copy text often used to show font face samples, for page layout and design as sample layout text by printers, graphic designers, Web designers, people creating Microsoft Word templates, and many other uses. It mimics the look of real text quite well as you design and set up your page layouts",
                      style:TextStyle(fontSize: 18,)
                    ),

                    AddToCartBtn()
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
