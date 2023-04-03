import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/food_controller.dart';
import '../resoures/color.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodController foodController = Get.put(FoodController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorGreen,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          height: 25,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: colorGreen,
              )),
        ),
        title: const Text("Mangpura, BD",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
      ),
      body: Obx(() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              shadowColor: Colors.grey.withOpacity(0.3),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          "Total Item: " +
                              foodController.totalItem.value.toString(),
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Total Price: " +
                              foodController.totalPrice.value.toString(),
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foodController.foodCartList.value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    shadowColor: Colors.grey.withOpacity(0.3),
                    child: Container(
                      height: 190,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(foodController
                                            .foodCartList[index].photo))),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      foodController
                                          .foodCartList[index].name,
                                      style:
                                      TextStyle(
                                          color: Colors.black
                                              .withOpacity(0.8),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600)),
                                  Row(
                                    children: [
                                      Text(
                                        "20min",
                                        style: TextStyle(
                                            color: Colors.grey
                                                .withOpacity(0.5),
                                            fontSize: 16,
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
                                            color: Colors.grey
                                                .withOpacity(0.5),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Text(
                                      "Rs." +
                                          foodController
                                              .foodCartList[index].price
                                              .toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Get.bottomSheet(Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(
                                        height: 300,
                                        width: MediaQuery.of(context)
                                            .size
                                            .width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: ListWheelScrollView(
                                                perspective: 0.01,
                                                itemExtent: 60,
                                                diameterRatio: 2.5,
                                                useMagnifier: true,
                                                magnification: 1.2,
                                                onSelectedItemChanged:
                                                    (val) {
                                                  foodController.counter
                                                      .value = val + 2;
                                                  print(foodController
                                                      .counter.value);
                                                },
                                                overAndUnderCenterOpacity:
                                                0.4,
                                                children:
                                                [
                                                  2,
                                                  3,
                                                  4,
                                                  5,
                                                  6,
                                                  7,
                                                  8,
                                                  9,
                                                  10
                                                ]
                                                    .map((e) => Padding(
                                                  padding: const EdgeInsets
                                                      .only(
                                                      top: 5,
                                                      bottom: 5,
                                                      left: 20,
                                                      right:
                                                      20),
                                                  child:
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey
                                                            .withOpacity(
                                                            0.2),
                                                        borderRadius:
                                                        BorderRadius.circular(5)),
                                                    child:
                                                    Center(
                                                      child: Text(
                                                          e
                                                              .toString(),
                                                          style: const TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 18)),
                                                    ),
                                                  ),
                                                ))
                                                    .toList(),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                print(
                                                    "${foodController.foodCartList.value[index].actualPrice} * ${foodController.counter.value} = ${foodController.foodCartList.value[index].actualPrice * foodController.counter.value}");
                                                foodController.updateFood(
                                                    quantity: foodController
                                                        .counter.value,
                                                    price: foodController
                                                        .foodCartList
                                                        .value[index]
                                                        .actualPrice *
                                                        foodController
                                                            .counter.value,
                                                    photo: foodController
                                                        .foodCartList[index]
                                                        .photo);
                                                Get.back();
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5),
                                                  color: colorGreen,
                                                ),
                                                child: const Center(
                                                  child: Text("Done",
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          fontSize: 18)),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                width: 1,
                                                color: Colors.grey))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        children: [
                                          Text(
                                              foodController.foodCartList
                                                  .value[index].quantity
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight.w600)),
                                          const Spacer(),
                                          const Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    foodController.deleteFood(
                                        food: foodController
                                            .foodCartList[index]);
                                    Get.snackbar("Delete Item",
                                        "1 item delete from cart.");
                                  },
                                  child: Container(
                                    height: 50,
                                    child: const Center(
                                      child: const Text("Remove",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}