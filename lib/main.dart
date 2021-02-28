import 'package:burger_buildr/helpers/app_constants.dart';
import 'package:burger_buildr/providers/user_order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserOrderProvider>(
      create: (context) => UserOrderProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Burger Builder',
        theme: ThemeData(
          primaryColor: AppConstants.hexToColor(AppConstants.APP_PRIMARY_COLOR),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}
