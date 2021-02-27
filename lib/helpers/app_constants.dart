import 'package:flutter/material.dart';

class AppConstants {
  static const String APP_PRIMARY_COLOR = "#703B09";
  static const String APP_BACKGROUND_COLOR = "#F6F8F9";

  static const String INGREDIENT_BREAD_TOP_COLOR = "#e27b36";
  static const String INGREDIENT_BREAD_BOTTOM_COLOR = "#F08E4A";
  static const String INGREDIENT_MEAT_COLOR = "#7f3608";
  static const String INGREDIENT_CHEESE_COLOR = "#f4d004";
  static const String INGREDIENT_BACON_COLOR = "#bf3813";
  static const String INGREDIENT_SALAD_COLOR = "#228c1d";
  static const String INGREDIENT_SEED_COLOR = "#c9c9c9";

  static const String BUILD_CONTROLS_CONTAINER_COLOR = "#CF8F2E";

  static const String BUTTON_BACKGROUND_COLOR = "#DAD735";
  static const String BUTTON_TEXT_COLOR = "#966909";

  static const String BUTTON_COLOR = "#8F5E1E";
  static const String BUTTON_COLOR_CONTINUE = "#5C9210";

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
