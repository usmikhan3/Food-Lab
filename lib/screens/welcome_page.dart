import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget {


  Widget button({@required String name, Color color, Color textColor}){
    return Container(
        height: 60,
        width: 300,
        child: RaisedButton(
          onPressed: (){},
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

  Widget headingText({@required String text, Color color}){
    return Text(
      text,
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w800,
          color: color
      ),
    );
  }

  Widget subText({@required String text, Color color}){
    return Text(
      text,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: color
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            children: [
              Expanded(
                  child: Container(
                    child: Center(
                      child: Image.asset("assets/images/junk-food.png"),
                    ),
                  )
              ),

              Expanded(
                  child: Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                      headingText(text: "Welcome to Food Lab", color: Colors.orange),
                       Column(
                         children: [
                           subText(text: "Order food from our restaurant and", color: Colors.black),
                           subText(text: "make reservation in real time", color: Colors.black )
                         ],
                       ),

                       button(name:"Login", color: Colors.orangeAccent, textColor: Colors.white),
                       button(name:"Register", color: Colors.white, textColor: Colors.black)
                       

                     ],
                   ),
                  )
              )
            ],
          ),
    );
  }
}
