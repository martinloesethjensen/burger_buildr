import 'package:burger_buildr/models/user_order_model.dart';
import 'package:burger_buildr/widgets/burger_ingredient.dart';
import 'package:flutter/material.dart';

class Burger extends StatefulWidget {
  final UserOrderModel? userOrderModel;

  const Burger({Key? key, this.userOrderModel}) : super(key: key);

  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  @override
  Widget build(BuildContext context) {
    final userIngredients = widget.userOrderModel!.userIngredients;
    final emptyIngredients =
        userIngredients == null || userIngredients.length == 0;
    return Container(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BurgerIngredient(type: "bread-top"),
                  if (emptyIngredients) EmptyIngredients(),
                  ...transformedIngredients,
                  BurgerIngredient(type: "bread-bottom"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  get transformedIngredients {
    final userIngredients = widget.userOrderModel!.userIngredients!;
    List<Widget> ingredientsList = [];
    for (var selectedIngredient in userIngredients) {
      for (var i = 0; i < selectedIngredient!.count; i++) {
        ingredientsList.add(
          BurgerIngredient(type: selectedIngredient.ingredient!.name),
        );
      }
    }
    return ingredientsList;
  }
}

class EmptyIngredients extends StatelessWidget {
  const EmptyIngredients({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Please start adding ingredients!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
