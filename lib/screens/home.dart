import 'package:flutter/material.dart';
import 'package:food_shop/models/category_model.dart';
import 'package:food_shop/models/food_category_model.dart';
import 'package:food_shop/models/food_model.dart';
import 'package:food_shop/provider/my_provider.dart';
import 'package:food_shop/screens/categories.dart';
import 'package:food_shop/widgets/category_container.dart';
import 'package:food_shop/widgets/drawer.dart';
import 'package:food_shop/widgets/product_container_homepage.dart';
import 'package:food_shop/widgets/search_field.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {



  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //TODO: CATEGORIES LISTS
  List<CategoriesModel> pizzaList = [];
  List<CategoriesModel> burgerList = [];
  List<CategoriesModel> bbqList = [];
  List<CategoriesModel> chineseList = [];
  List<CategoriesModel> desiList = [];
  List<CategoriesModel> shakesList = [];


  //TODO: FOODS LISTS
  List<FoodModel> singleFoodList = [];

  //TODO: FOOD CATEGORIES LISTS
  List<FoodCategoryModel> burgerCategoryList = [];
  List<FoodCategoryModel> pizzaCategoryList = [];



  //TODO: CATEGORIES WIDGETS
  Widget pizza(){
    return Row(
      children: pizzaList.map((e) => CategoryContainer(
          image: e.image,
          name: e.name,
        onTap: (){
          Navigator.of(context)
              .push(
              MaterialPageRoute(builder: (_)=>Categories(
                list: pizzaCategoryList,
              ))
          );
        },
      )).toList(),

    );
  }

  Widget burger(){
    return Row(
        children: burgerList.map((e) => CategoryContainer(
            image: e.image,
            name: e.name,
            onTap: (){
              Navigator.of(context)
                  .push(
                  MaterialPageRoute(builder: (context)=>Categories(
                    list: burgerCategoryList,
                  ))
              );
            },
        )).toList()
    );
  }

  Widget desi(){
    return Row(
        children: desiList.map((e) => CategoryContainer(
            image: e.image,
            name: e.name,
            onTap: (){}
        )).toList()
    );
  }

  Widget bbq(){
    return Row(
        children: bbqList.map((e) => CategoryContainer(
            image: e.image,
            name: e.name,
            onTap: (){}
        )).toList()
    );
  }

  Widget shakes(){
    return Row(
        children: shakesList.map((e) => CategoryContainer(
            image: e.image,
            name: e.name,
            onTap: (){}
        )).toList()
    );
  }

  Widget chinese(){
    return Row(
        children: chineseList.map((e) => CategoryContainer(
            image: e.image,
            name: e.name,
            onTap: (){}
        )).toList()
    );
  }



  @override
  Widget build(BuildContext context) {

    MyProvider provider = Provider.of<MyProvider>(context);

    //TODO:pizza category provider
    provider.getPizzaCategory();
    pizzaList = provider.throwPizzaList;

    //TODO:burger category provider
    provider.getBurgerCategory();
    burgerList = provider.throwBurgerList;

    //TODO:desi category provider
    provider.getDesiCategory();
    desiList = provider.throwDesiList;

    //TODO:chinese category provider
    provider.getChineseCategory();
    chineseList = provider.throwChineseList;

    //TODO:bbq category provider
    provider.getBbqCategory();
    bbqList = provider.throwBbqList;

    //TODO:shakes category provider
    provider.getShakesCategory();
    shakesList = provider.throwShakesList;


    //TODO:Single food provider
    provider.getSingleFoodList();
    singleFoodList = provider.throwFood1List;

    //TODO: burger category list  provider
    provider.getBurgerCategory();
    burgerCategoryList = provider.throwBurgerCategoryList;

    //TODO: pizza category list  provider
    // provider.getPizzaCategory();
    // pizzaCategoryList = provider.throwPizzaCategoryList;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: MyDrawer(
        accountImage: "assets/images/man.png",
        accountName: "Usman Khan",
        accountEmail: "usmi.khan3@gmail.com",
      ),


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

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SearchField(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                pizza(),
                burger(),
                bbq(),
                desi(),
                chinese(),
                shakes()
                // CategoryContainer(image: "assets/images/1.jpg", name: "Pizza",),
                // CategoryContainer(image: "assets/images/2.png", name: "Burger",),
                // CategoryContainer(image: "assets/images/3.webp", name: "BBQ",),
                // CategoryContainer(image: "assets/images/4.jpg", name: "Chinese",),
                // CategoryContainer(image: "assets/images/5.jpg", name: "Chinese",),
                // CategoryContainer(image: "assets/images/1.jpg", name: "Chinese",),
                // CategoryContainer(image: "assets/images/1.jpg", name: "Chinese",)

              ],
            ),
          ),
          SizedBox(height: 10,),
          SingleChildScrollView(
          child: Container(
            height: 450,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: GridView.count(
              shrinkWrap: false,
              primary: false,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              children: singleFoodList
                  .map((e) =>
                  ProductContainer(
                    image: e.image,
                    name: e.name,
                    price: e.price,
                  )
              ).toList(),
              // children: [
              //  
              //   ProductContainer(name: "Pizza", price: 120.0, image: "assets/images/1.jpg",),
              //   ProductContainer(name: "Burger", price: 120.0, image: "assets/images/2.png",),
              //   ProductContainer(name: "BBQ", price: 120.0, image: "assets/images/4.jpg",),
              //   ProductContainer(name: "BBQ", price: 120.0, image: "assets/images/5.jpg",),
              //   ProductContainer(name: "BBQ", price: 120.0, image: "assets/images/3.webp",)
              // ],
            ),
          ),
        )



        ],
      )
    );
  }
}


