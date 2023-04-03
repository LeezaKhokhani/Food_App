import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../controller/food_controller.dart';
import '../helpers/like_helper.dart';
import '../resoures/color.dart';
import '../resoures/food_list.dart';
import 'cart_page.dart';
import 'detail_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodController foodController = Get.put(FoodController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        centerTitle: true,
        leading: Container(
          height: 10,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green,
          ),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ),
        title: const Text("Mangpura, BD",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black)),

      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi Jonny",
                    style: TextStyle(
                      color: colorGreen,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "What do you want to eat Today?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: colorGreen,
                          ),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.2),
                          border: InputBorder.none,
                          hintText: "Search Food",
                          suffixIcon: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: colorGreen,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.menu_open_sharp,
                                  color: Colors.white,
                                )),
                          )),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 15,
                child: GridView.builder(
                    itemCount: foodList.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (200 / 350),
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, i) {
                      return Container(
                        height: 300,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 100,
                                ),
                                IconButton(
                                  onPressed: () {
                                    FoodLikeHelper.foodLikeHelper
                                        .insertData(id: 1, food: foodList[i]);
                                  },
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => DetailFoodPage(food: foodList[i]));
                              },
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(foodList[i].photo))),
                              ),
                            ),
                            Text(
                              foodList[i].name,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 18,
                                ),
                                Text(
                                  "20min",
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.5),
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.5),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  foodList[i].actualPrice.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: colorGreen,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      )),
                                  child: IconButton(
                                    onPressed: () {
                                      foodController.insertFood(
                                          id: 1, food: foodList[i]);
                                      Get.snackbar("Insert Item",
                                          "1 item added into cart.");
                                    },
                                    icon: Icon(Icons.add, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorGreen,
        onPressed: () {
          Get.to(() => CartPage());
        },
        child: const Icon(
          Icons.shopping_cart,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: colorGreen), label: ""),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.keyboard,
                color: Colors.grey,
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_active,
                color: Colors.grey,
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.grey,
              ),
              label: ""),
        ],
      ),
    );
  }
}