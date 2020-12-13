import 'package:flutter/material.dart';
import 'package:food_shop/models/food_category_model.dart';
import 'package:food_shop/widgets/product_container_homepage.dart';

class Categories extends StatefulWidget {

  List<FoodCategoryModel> list = [];
  Categories({@required this.list});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/man.png'),
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: GridView.count(
          shrinkWrap: false,
          primary: false,
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          children: widget.list
              .map((e) =>
              ProductContainer(
                image: e.image,
                name: e.name,
                price: e.price,
              )
          ).toList(),
        ),
      ),
    );
  }
}
