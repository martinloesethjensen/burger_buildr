import 'package:burger_buildr/models/ingredients_model.dart';

class UserOrderModel {
  final String customer;
  final List<UserSelectedIngredientModel> userIngredients;
  double totalPrice;
  UserOrderModel({this.customer, this.userIngredients, this.totalPrice});

  factory UserOrderModel.fromJson(Map<String, dynamic> json) => UserOrderModel(
        customer: json['customer'] as String,
        userIngredients: json['userIngredients'].forEach((v) {
          return (new UserSelectedIngredientModel.fromJson(v));
        }),
        totalPrice: json['totalPrice'] as double,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer'] = this.customer;
    data['userIngredients'] =
        List<dynamic>.from(userIngredients.map((x) => x.toJson()));
    data['totalPrice'] = this.totalPrice.toStringAsFixed(2);
    return data;
  }
}

class UserSelectedIngredientModel {
  IngredientsModel ingredient;
  int count;
  UserSelectedIngredientModel({this.ingredient, this.count});

  factory UserSelectedIngredientModel.fromJson(Map<String, dynamic> json) =>
      UserSelectedIngredientModel(
          ingredient: IngredientsModel.fromJson(json['ingredient']),
          count: json['count'] as int);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ingredient'] = this.ingredient.toJson();
    data['count'] = this.count;
    return data;
  }
}
