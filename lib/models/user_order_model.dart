import 'package:burger_buildr/models/ingredients_model.dart';

class UserOrderModel {
  final String? customer;
  final List<UserSelectedIngredientModel?>? userIngredients;
  double? totalPrice;

  UserOrderModel({this.customer, this.userIngredients, this.totalPrice});

  factory UserOrderModel.fromJson(Map<String, dynamic> json) => UserOrderModel(
        customer: json['customer'] as String?,
        userIngredients: json['userIngredients']
            .map((v) => UserSelectedIngredientModel.fromJson(v))
            .toList(),
        totalPrice: json['totalPrice'] as double?,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['customer'] = this.customer;
    data['userIngredients'] = userIngredients!.map((x) => x!.toJson()).toList();
    data['totalPrice'] = this.totalPrice!.toStringAsFixed(2);
    return data;
  }
}

class UserSelectedIngredientModel {
  IngredientsModel? ingredient;
  int count;
  UserSelectedIngredientModel({this.ingredient, required this.count});

  factory UserSelectedIngredientModel.fromJson(Map<String, dynamic> json) =>
      UserSelectedIngredientModel(
          ingredient: IngredientsModel.fromJson(json['ingredient']),
          count: json['count'] as int);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ingredient'] = this.ingredient!.toJson();
    data['count'] = this.count;
    return data;
  }
}
