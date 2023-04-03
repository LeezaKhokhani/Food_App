import 'package:flutter/material.dart';
import '../moduls/food.dart';
import '../resoures/color.dart';

class DetailFoodPage extends StatelessWidget {
  DetailFoodPage({Key? key, required this.food}) : super(key: key);
  Food food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorGreen,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          height: 50,
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(food.photo),
                    )),
              ),
            ),
            Text(
              food.name,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  "Rs." + food.actualPrice.toString(),
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold, color: colorGreen),
                ),
                Spacer(),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  "4.5",
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),

            Text(
              "About Food",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500.",
              style: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
            Center(
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: colorGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text("Add to Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}