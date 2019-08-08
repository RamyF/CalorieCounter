import 'package:flutter/material.dart';
import '../model/food.dart';

// Views for each tab in Add View

// add food tab
class AddFood extends StatelessWidget {
  final List<Food> foods = [
    Food("Chobani Yogurt", 200),
    Food("Burrito", 500),
    Food("Protein Bowl", 400),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (BuildContext context, int index) =>
            buildFoodCard(context, index),
      ),
    );
  }

  Widget buildFoodCard(BuildContext context, int index) {
    final food = foods[index];
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 25.0),
                  child: Text("${food.foodName}"),
                ),
                Text(" ${food.calories.toString()} calories"),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}

// add weight
class LogWeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
    );
  }
}
