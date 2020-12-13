import 'package:flutter/material.dart';

class FoodImageContainer extends StatelessWidget {

  final String image;

  const FoodImageContainer({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: NetworkImage(image),
      ),
    );
  }
}
