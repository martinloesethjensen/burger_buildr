import 'dart:convert';

import 'package:burger_buildr/models/ingredients_model.dart';
import 'package:burger_buildr/models/user_order_model.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static const url =
      'https://burgerbuilder-b9205-default-rtdb.europe-west1.firebasedatabase.app';
  Future<bool> sendData(List<IngredientsModel> data) async {
    final body = jsonEncode(data.map((e) => e.toJson()).toList());

    final uri = Uri.parse('$url/burgeringredients.json');
    final response = await http.put(uri, body: body);

    return response.statusCode == 200;
  }

  Future<List<IngredientsModel>> fetchTheIngredients() async {
    final uri = '$url/burgeringredients.json';
    final response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<IngredientsModel>((json) => IngredientsModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Could not fetch ingredients');
    }
  }

  Future<String> purchaseContinue(UserOrderModel userOrderModel) async {
    final body = jsonEncode(userOrderModel);

    final uri = Uri.parse('$url/orders.json');
    final response = await http.post(uri, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return response.body;
    } else {
      throw Exception('Failed to add order');
    }
  }
}
