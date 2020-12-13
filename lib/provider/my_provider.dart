import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_shop/models/category_model.dart';
import 'package:food_shop/models/food_category_model.dart';
import 'package:food_shop/models/food_model.dart';

class MyProvider extends ChangeNotifier{

  //TODO: FIRST CATEGORY: PIZZA

  List<CategoriesModel> pizzaList= [];
  CategoriesModel pizzaModel;

  Future<void> getPizzaCategory() async{

    List<CategoriesModel> newPizzaList= [];
    QuerySnapshot querySnapshot =
      await FirebaseFirestore
        .instance
        .collection("categories")
        .doc('r0RAEf9dGqhBwlvbIrbM')
        .collection('pizza')
        .get();
    querySnapshot.docs.forEach((element) { 
      pizzaModel = CategoriesModel(
          image: element.data()['image'],
          name: element.data()['name']
      );
      print(pizzaModel.name);
      newPizzaList.add(pizzaModel);
      pizzaList = newPizzaList;
    });
  }
get throwPizzaList{
    return pizzaList;
}


  //TODO: FIRST CATEGORY: BURGER

  List<CategoriesModel> burgerList= [];
  CategoriesModel burgerModel;

  Future<void> getBurgerCategory() async{

    List<CategoriesModel> newBurgerList= [];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore
        .instance
        .collection("categories")
        .doc('r0RAEf9dGqhBwlvbIrbM')
        .collection('burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerModel = CategoriesModel(
          image: element.data()['image'],
          name: element.data()['name']
      );
      print(burgerModel.name);
      newBurgerList.add(burgerModel);
      burgerList = newBurgerList;
    });
  }
  get throwBurgerList{
    return burgerList;
  }


  //TODO: FIRST CATEGORY: DESI

  List<CategoriesModel> desiList= [];
  CategoriesModel desiModel;

  Future<void> getDesiCategory() async{

    List<CategoriesModel> newDesiList= [];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore
        .instance
        .collection("categories")
        .doc('r0RAEf9dGqhBwlvbIrbM')
        .collection('Desi')
        .get();
    querySnapshot.docs.forEach((element) {
      desiModel = CategoriesModel(
          image: element.data()['image'],
          name: element.data()['name']
      );
      print(desiModel.name);
      newDesiList.add(desiModel);
      desiList = newDesiList;
    });
  }
  get throwDesiList{
    return desiList;
  }


  //TODO: FIRST CATEGORY: BBQ

  List<CategoriesModel> bbqList= [];
  CategoriesModel bbqModel;

  Future<void> getBbqCategory() async{

    List<CategoriesModel> newBbqList= [];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore
        .instance
        .collection("categories")
        .doc('r0RAEf9dGqhBwlvbIrbM')
        .collection('bbq')
        .get();
    querySnapshot.docs.forEach((element) {
      bbqModel = CategoriesModel(
          image: element.data()['image'],
          name: element.data()['name']
      );
      print(bbqModel.name);
      newBbqList.add(bbqModel);
      bbqList = newBbqList;
    });
  }
  get throwBbqList{
    return bbqList;
  }


  //TODO: FIRST CATEGORY: CHINESE

  List<CategoriesModel> chineseList= [];
  CategoriesModel chineseModel;

  Future<void> getChineseCategory() async{

    List<CategoriesModel> newChineseList= [];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore
        .instance
        .collection("categories")
        .doc('r0RAEf9dGqhBwlvbIrbM')
        .collection('chinese')
        .get();
    querySnapshot.docs.forEach((element) {
      chineseModel = CategoriesModel(
          image: element.data()['image'],
          name: element.data()['name']
      );
      print(chineseModel.name);
      newChineseList.add(chineseModel);
      chineseList = newChineseList;
    });
  }
  get throwChineseList{
    return chineseList;
  }



  //TODO: FIRST CATEGORY: SHAKES

  List<CategoriesModel> shakesList= [];
  CategoriesModel shakesModel;

  Future<void> getShakesCategory() async{

    List<CategoriesModel> newShakesList= [];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore
        .instance
        .collection("categories")
        .doc('r0RAEf9dGqhBwlvbIrbM')
        .collection('shakes')
        .get();
    querySnapshot.docs.forEach((element) {
      shakesModel = CategoriesModel(
          image: element.data()['image'],
          name: element.data()['name']
      );
      print(shakesModel.name);
      newShakesList.add(shakesModel);
      shakesList = newShakesList;
    });
  }
  get throwShakesList{
    return shakesList;
  }


//TODO: SINGLE FOOD

List<FoodModel> foodList = [];
FoodModel foodModel;

Future<void> getSingleFoodList() async{
  List<FoodModel> newFoodList= [];
  QuerySnapshot querySnapshot =
  await FirebaseFirestore
      .instance
      .collection('foods')
      .get();

  querySnapshot.docs.forEach((element) {
    foodModel = FoodModel(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price']
    );
    print(foodModel.name);
    newFoodList.add(foodModel);
    foodList = newFoodList;
  });
}
  get throwFood1List{
    return foodList;
  }


//TODO: BURGER CATEGORY ITEMS

List<FoodCategoryModel> burgerCategoryList= [];
FoodCategoryModel burgerCategoryModel;

Future<void> getBurgerCategoryList() async{
  List<FoodCategoryModel> newBurgerCategoryList= [];
  QuerySnapshot querySnapshot =
      await FirebaseFirestore
          .instance.collection("foodCategories")
          .doc('Cf6G7Bhwpz6XGtzJhcTd')
          .collection('burger')
          .get();

  querySnapshot.docs.forEach((element) {
    burgerCategoryModel = FoodCategoryModel(
        image: element.data()['image'],
        name: element.data()['name'],
        price: element.data()['price']
    );
    print(burgerCategoryModel.name);
    newBurgerCategoryList.add(burgerCategoryModel);
    burgerCategoryList = newBurgerCategoryList;
  });

}
get throwBurgerCategoryList{
  return burgerCategoryList;
}


//TODO: PIZZA CATEGORY ITEMS
//
//   List<FoodCategoryModel> pizzaCategoryList= [];
//   FoodCategoryModel pizzaCategoryModel;
//
//   Future<void> getPizzaCategoryList() async{
//     List<FoodCategoryModel> newPizzaCategoryList= [];
//     QuerySnapshot querySnapshot =
//     await FirebaseFirestore.instance.collection("foodCategory").doc('vByfjdcoQ9RKQ4gKY13g').collection('pizza').get();
//
//     querySnapshot.docs.forEach((element) {
//       pizzaCategoryModel = FoodCategoryModel(
//           image: element.data()['image'],
//           name: element.data()['name'],
//           price: element.data()['price']
//       );
//       print(pizzaCategoryModel.name);
//       newPizzaCategoryList.add(burgerCategoryModel);
//       pizzaCategoryList = newPizzaCategoryList;
//     });
//
//   }
//   get throwPizzaCategoryList{
//     return pizzaCategoryList;
//   }




}