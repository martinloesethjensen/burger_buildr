import 'package:burger_buildr/helpers/app_constants.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class BurgerIngredient extends StatefulWidget {
  final String? type;

  const BurgerIngredient({Key? key, this.type}) : super(key: key);

  @override
  _BurgerIngredientState createState() => _BurgerIngredientState();
}

class _BurgerIngredientState extends State<BurgerIngredient> {
  @override
  Widget build(BuildContext context) {
    const double BURGER_WIDTH = 325;
    var ingredient;
    switch (widget.type) {
      case ('bread-top'):
        ingredient = Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Stack(
            children: [
              Container(
                height: 60,
                width: BURGER_WIDTH,
                decoration: BoxDecoration(
                  color: AppConstants.hexToColor(
                      AppConstants.INGREDIENT_BREAD_TOP_COLOR),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.1,
                        0.9
                      ],
                      colors: [
                        AppConstants.hexToColor("#C15711"),
                        AppConstants.hexToColor("#C15711")
                      ]),
                  boxShadow: [
                    BoxShadow(
                      color: AppConstants.hexToColor("#c15711"),
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SeedsWidget(),
                ),
              ),
              Container(
                height: 60,
                width: 315,
                decoration: BoxDecoration(
                  color: AppConstants.hexToColor("#e27b36"),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.1,
                        0.9
                      ],
                      colors: [
                        AppConstants.hexToColor("#e27b36"),
                        AppConstants.hexToColor("#bc581e"),
                      ]),
                  boxShadow: [
                    BoxShadow(
                      color: AppConstants.hexToColor("#c15711"),
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SeedsWidget(),
                ),
              ),
            ],
          ),
        );
        break;
      case ('bread-bottom'):
        ingredient = Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Stack(
            children: [
              Container(
                height: 50,
                width: BURGER_WIDTH,
                decoration: BoxDecoration(
                  color: AppConstants.hexToColor("#c15711"),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppConstants.hexToColor("#c15711"),
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
              Container(
                  height: 50,
                  width: 315,
                  decoration: BoxDecoration(
                    color: AppConstants.hexToColor("#e27b36"),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.1,
                          0.9
                        ],
                        colors: [
                          AppConstants.hexToColor("#F08E4A"),
                          AppConstants.hexToColor("#e27b36")
                        ]),
                    boxShadow: [
                      BoxShadow(
                        color: AppConstants.hexToColor("#e27b36"),
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  )),
            ],
          ),
        );
        break;

      case ('meat'):
        ingredient = Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
              width: BURGER_WIDTH,
              height: 30,
              decoration: BoxDecoration(
                color:
                    AppConstants.hexToColor(AppConstants.INGREDIENT_MEAT_COLOR),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.1,
                      0.9
                    ],
                    colors: [
                      AppConstants.hexToColor("#7f3608"),
                      AppConstants.hexToColor("#702e05")
                    ]),
              )),
        );
        break;
      case ('cheese'):
        ingredient = Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 15,
            width: 355,
            decoration: BoxDecoration(
              color:
                  AppConstants.hexToColor(AppConstants.INGREDIENT_CHEESE_COLOR),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.1,
                    0.9
                  ],
                  colors: [
                    AppConstants.hexToColor("#f4d004"),
                    AppConstants.hexToColor("#d6bb22")
                  ]),
            ),
          ),
        );
        break;
      case ('bacon'):
        ingredient = Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 15,
            width: BURGER_WIDTH,
            decoration: BoxDecoration(
              color:
                  AppConstants.hexToColor(AppConstants.INGREDIENT_BACON_COLOR),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.1,
                    0.9
                  ],
                  colors: [
                    AppConstants.hexToColor("#bf3813"),
                    AppConstants.hexToColor("#c45e38")
                  ]),
            ),
          ),
        );
        break;
      case ('salad'):
        ingredient = Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 20,
            width: 340,
            decoration: BoxDecoration(
              color:
                  AppConstants.hexToColor(AppConstants.INGREDIENT_SALAD_COLOR),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.1,
                    0.9
                  ],
                  colors: [
                    AppConstants.hexToColor("#228c1d"),
                    AppConstants.hexToColor("#91ce50")
                  ]),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
        );
        break;
      default:
        ingredient = null;
    }

    return ingredient;
  }
}

class SeedsWidget extends StatelessWidget {
  const SeedsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.rotate(
          angle: -math.pi / 3,
          child: Container(
            height: 15,
            width: 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppConstants.hexToColor(
                        AppConstants.INGREDIENT_SEED_COLOR),
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
          ),
        ),
        Transform.rotate(
          angle: 45,
          child: Container(
            height: 15,
            width: 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppConstants.hexToColor(
                        AppConstants.INGREDIENT_SEED_COLOR),
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
          ),
        ),
        Transform.rotate(
          angle: 5,
          child: Container(
            height: 15,
            width: 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppConstants.hexToColor(
                        AppConstants.INGREDIENT_SEED_COLOR),
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
          ),
        ),
        Transform.rotate(
          angle: -math.pi / 5,
          child: Container(
            height: 15,
            width: 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppConstants.hexToColor(
                        AppConstants.INGREDIENT_SEED_COLOR),
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
          ),
        ),
        Transform.rotate(
          angle: math.pi / 8,
          child: Container(
            height: 15,
            width: 6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppConstants.hexToColor(
                        AppConstants.INGREDIENT_SEED_COLOR),
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
