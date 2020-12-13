import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {

  final String image;
  final String name;
  final int price;

  const ProductContainer({this.image, this.name, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
          color: Colors.deepOrange[200],
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(image),
          ),
          ListTile(
            title: Text(name,style: TextStyle(fontSize: 19),),
            trailing: Text("\R\s$price",style: TextStyle(fontSize: 20),),
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.white,),
              Icon(Icons.star,  color: Colors.white),
              Icon(Icons.star,  color: Colors.white),
              Icon(Icons.star,  color: Colors.white),
              Icon(Icons.star,  color: Colors.white),
            ],
          )
        ],
      ),
    );
  }
}
