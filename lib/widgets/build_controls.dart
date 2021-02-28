import 'package:burger_buildr/helpers/app_constants.dart';
import 'package:burger_buildr/models/ingredients_model.dart';
import 'package:burger_buildr/models/user_order_model.dart';
import 'package:burger_buildr/providers/user_order_provider.dart';
import 'package:burger_buildr/screens/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;

import 'build_control.dart';

class BuildControls extends StatefulWidget {
  BuildControls(
      {Key? key,
      this.userOrderModel,
      this.addHandler,
      this.removeHandler,
      this.ingredients})
      : super(key: key);
  final UserOrderModel? userOrderModel;
  final Function? addHandler;
  final Function? removeHandler;
  final List<IngredientsModel>? ingredients;

  @override
  _BuildControlsState createState() => _BuildControlsState();
}

class _BuildControlsState extends State<BuildControls> {
  @override
  Widget build(BuildContext context) {
    final totalPrice = Provider.of<UserOrderProvider>(context, listen: true)
            .userOrderModel
            .totalPrice ??
        0;
    return Container(
      color:
          AppConstants.hexToColor(AppConstants.BUILD_CONTROLS_CONTAINER_COLOR),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Current Price:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          buttonBar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    color: AppConstants.hexToColor(
                      AppConstants.BUTTON_TEXT_COLOR,
                    ),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  AppConstants.hexToColor(
                    totalPrice <= 0
                        ? AppConstants.BUTTON_COLOR
                        : AppConstants.BUTTON_BACKGROUND_COLOR,
                  ),
                ),
                elevation: MaterialStateProperty.resolveWith<double?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) return 16;
                  return null;
                }),
              ),
              onPressed: totalPrice <= 0
                  ? null
                  : () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: OrderSummary(),
                        ),
                      );
                    },
              child: const Text('ORDER NOW', style: TextStyle(fontSize: 20)),
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }

  Widget buttonBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.ingredients!.map<Widget>((ingredient) {
        final userIngredient =
            Provider.of<UserOrderProvider>(context, listen: true)
                .userOrderModel
                .userIngredients!
                .singleWhere(
                  (ing) => ing?.ingredient?.name == ingredient.name,
                  orElse: () => null,
                );

        final currentCount = userIngredient?.count ?? 0;

        return BuildControl(
          ingredient: ingredient,
          currentValue: currentCount,
        );
      }).toList(),
    );
  }
}
