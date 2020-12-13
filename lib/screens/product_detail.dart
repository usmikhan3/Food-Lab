import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_shop/provider/my_provider.dart';
import 'package:food_shop/screens/home.dart';
import 'package:food_shop/widgets/add_to_cart_btn.dart';
import 'package:food_shop/widgets/food_detail_image_container.dart';
import 'package:food_shop/widgets/increment_decrement.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  final String image;
  final String name;
  final int price;

  const ProductDetail({@required this.image,@required this.name,@required this.price});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  int quantity = 1;
  @override
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
      body: Column(
        children: [


          //TODO: IMAGE CONTAINER
          Expanded(
              child: FoodImageContainer(image: widget.image,)
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
                    Text("${widget.name}",
                      style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),
                    Text("Any Text",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            //TODO: DECREMENT BUTTON
                            GestureDetector(
                              onTap:(){
                                setState(() {
                                  quantity--;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.pink[100],
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Icon(Icons.remove),
                              ),
                            ),

                            SizedBox(width: 10,),

                            //TODO: COUNTER
                            Text("$quantity", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),

                            SizedBox(width: 10,),

                            //TODO: INCREMENT BUTTON
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.pink[100],
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                        Text("\R\s ${widget.price}", style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),)
                      ],
                    ),

                    Text("Description",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500) ),

                    Text("Below is a sample of “Lorem ipsum dolor sit” dummy copy text often used to show font face samples, for page layout and design as sample layout text by printers, graphic designers, Web designers, people creating Microsoft Word templates, and many other uses. It mimics the look of real text quite well as you design and set up your page layouts",
                      style:TextStyle(fontSize: 18,)
                    ),

                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        color: Color(0xFFffcdd2),
                        onPressed: (){
                          provider.addToCart(
                              image: widget.image,
                              name: widget.name,
                              price: widget.price,
                              quantity: quantity);
                        },
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
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
