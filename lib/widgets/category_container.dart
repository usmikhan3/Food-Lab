import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {

  final String image;
  final String name;
  final Function onTap;

  const CategoryContainer({@required this.image,@required this.name, @required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(name, style: TextStyle(fontSize: 20),)
      ],
    );
  }
}
