import 'package:burger_buildr/models/dummy_data.dart';
import 'package:burger_buildr/models/ingredients_model.dart';
import 'package:burger_buildr/models/user_order_model.dart';
import 'package:burger_buildr/screens/burger.dart';
import 'package:burger_buildr/services/http_service.dart';
import 'package:burger_buildr/widgets/app_drawer.dart';
import 'package:burger_buildr/widgets/build_controls.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  UserOrderModel userOrderModel = UserOrderModel(
    customer: "sumith",
    userIngredients: [],
    totalPrice: 0,
  );

  List<IngredientsModel> ingredients = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey, // assign key to Scaffold
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/burger-logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text("Burger Builder"))
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () => _drawerKey.currentState.openDrawer(),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<IngredientsModel>>(
        future: HttpService().fetchTheIngredients(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? mainView(snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget mainView(data) {
    ingredients = data;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Burger(userOrderModel: userOrderModel),
        BuildControls(
          userOrderModel: userOrderModel,
          addHandler: _addIngredientHandler,
          removeHandler: _removeIngredientHandler,
          ingredients: ingredients,
        )
      ],
    );
  }

  _addIngredientHandler(String name) {
    var ingredient = ingredients.singleWhere((ing) => ing.name == name);

    final foundIngredient = userOrderModel.userIngredients.singleWhere(
      (element) => element.ingredient.name == name,
      orElse: () => null,
    );
    if (foundIngredient == null) {
      setState(() {
        userOrderModel.userIngredients.add(
          UserSelectedIngredientModel(ingredient: ingredient, count: 1),
        );
      });
    } else {
      setState(() {
        foundIngredient.count++;
      });
    }
    setState(() {
      userOrderModel.totalPrice = userOrderModel.totalPrice + ingredient.price;
    });
  }

  _removeIngredientHandler(name) {
    final ingredient = dummyData.singleWhere((ing) => ing.name == name);

    final foundIngredient = userOrderModel.userIngredients.singleWhere(
      (element) => element.ingredient.name == name,
      orElse: () => null,
    );
    if (foundIngredient != null) {
      setState(() {
        foundIngredient.count--;
      });
    }
    setState(() {
      userOrderModel.totalPrice = userOrderModel.totalPrice - ingredient.price;
      userOrderModel.userIngredients
          .removeWhere((element) => element.count == 0);
    });
  }
}
