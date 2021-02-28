import 'package:burger_buildr/helpers/app_constants.dart';
import 'package:burger_buildr/providers/user_order_provider.dart';
import 'package:burger_buildr/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderSummary extends StatefulWidget {
  OrderSummary({Key? key}) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserOrderProvider>(
      builder: (context, userOrderProvider, child) {
        final userOrderModel = userOrderProvider.userOrderModel;
        return Container(
          color: Color(0xff757575),
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Your Order',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'A delicious burger with the following ingredients:',
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: userOrderModel.userIngredients!.length,
                    separatorBuilder: (_, __) => Divider(height: 0.5),
                    itemBuilder: (BuildContext context, int index) {
                      var userIngredient =
                          userOrderModel.userIngredients![index]!;
                      return ListTile(
                        leading: Icon(
                          Icons.check_circle_outline_outlined,
                          color: AppConstants.hexToColor(
                              AppConstants.APP_PRIMARY_COLOR),
                        ),
                        title: Text(
                          '${userIngredient.ingredient!.label} (${userIngredient.ingredient!.price!.toStringAsFixed(2)})  X ${userIngredient.count}',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                        trailing: Text(
                          '${(userIngredient.ingredient!.price! * userIngredient.count).toStringAsFixed(2)} ',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  'Total Price : \$' +
                      "${userOrderModel.totalPrice!.toStringAsFixed(2)}",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: AppConstants.hexToColor(
                        AppConstants.BUTTON_COLOR_CONTINUE,
                      ),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Continue to Chekout?',
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      child: Text(
                        'CANCEL',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          AppConstants.hexToColor(
                            AppConstants.BUTTON_COLOR,
                          ),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    visible
                        ? CircularProgressIndicator(
                            backgroundColor: AppConstants.hexToColor(
                              AppConstants.APP_PRIMARY_COLOR,
                            ),
                          )
                        : TextButton(
                            child: Text(
                              'CONTINUE',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                AppConstants.hexToColor(
                                  AppConstants.BUTTON_COLOR_CONTINUE,
                                ),
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                visible = true;
                              });
                              var orderid = await HttpService()
                                  .purchaseContinue(userOrderModel);

                              if (orderid.length > 0) {
                                Provider.of<UserOrderProvider>(context,
                                        listen: false)
                                    .setDummyData();
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: Text('order placed - ' + orderid),
                                );
                              }
                              setState(() {
                                visible = false;
                              });
                              Navigator.pop(context);
                            },
                          ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
