import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/cart_helper.dart';
import '../moduls/food.dart';

class FoodController extends GetxController {
  RxList foodCartList = [].obs;
  RxInt totalItem = 0.obs;
  RxDouble totalPrice = 0.0.obs;
  RxInt counter = 2.obs;

  @override
  void onInit() {
    getList();
    getTotalItem();
    getTotalPrice();
    super.onInit();
  }

  getList() {
    FoodCartHelper.foodCartHelper
        .fetchAllData()
        .then((value) => value.forEach((element) {
      foodCartList.add(Food(
        photo: element["photo"].toString(),
        name: element["name"].toString(),
        price: int.parse(element["price"].toString()),
        quantity: int.parse(
          element["quantity"].toString(),
        ),
        actualPrice: int.parse(element["actualPrice"].toString()),
      ));

      print(foodCartList.length);
    }));
    print(foodCartList.length);
  }

  getTotalItem() {
    totalItem.value = 0;
    FoodCartHelper.foodCartHelper
        .fetchAllData()
        .then((value) => value.forEach((element) {
      totalItem.value += int.parse(element["quantity"].toString());
      print(totalItem.value);
    }));
  }

  getTotalPrice() {
    totalPrice.value = 0;
    FoodCartHelper.foodCartHelper
        .fetchAllData()
        .then((value) => value.forEach((element) {
      totalPrice.value += int.parse(element["price"].toString());
      print(totalPrice.value);
    }));
  }

  insertFood({required int id, required Food food}) {
    FoodCartHelper.foodCartHelper.insertData(id: id, food: food).then((value) =>
        foodCartList.add(Food(
            photo: food.photo,
            name: food.name,
            price: food.price,
            quantity: food.quantity,
            actualPrice: food.actualPrice)));
    getTotalPrice();
    getTotalItem();
  }

  updateFood(
      {required int quantity, required int price, required String photo}) {
    FoodCartHelper.foodCartHelper
        .updateData(quantity: quantity, price: price, photo: photo)
        .then((value) {
      getTotalPrice();
      getTotalItem();
      foodCartList.value.indexWhere((element) {
        if (element.photo == photo) {
          element.quantity = quantity;
          element.price = price;
        }
        return true;
      });
    });
  }

  deleteFood({required Food food}) {
    FoodCartHelper.foodCartHelper
        .deleteData(photo: food.photo, price: food.price)
        .then((value) => foodCartList.remove(food));
    getTotalPrice();
    getTotalItem();
  }
}