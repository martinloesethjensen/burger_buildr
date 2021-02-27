import 'package:burger_buildr/models/ingredients_model.dart';
import 'package:flutter/material.dart';

import 'custom_stepper.dart';

class BuildControl extends StatefulWidget {
  BuildControl(
      {Key key,
      @required this.ingredient,
      @required this.currentValue,
      @required this.addHandler,
      @required this.removeHandler})
      : super(key: key);

  final IngredientsModel ingredient;
  final int currentValue;
  final Function addHandler;
  final Function removeHandler;
  @override
  _BuildControlState createState() => _BuildControlState();
}

class _BuildControlState extends State<BuildControl> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.ingredient.label,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "(\$" + "${widget.ingredient.price.toStringAsFixed(2)})",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CustomStepper(
                  value: widget.currentValue,
                  upperLimit: 5,
                  lowerLimit: 0,
                  stepValue: 1,
                  iconSize: 25,
                  name: widget.ingredient.name,
                  addHandler: widget.addHandler,
                  removeHandler: widget.removeHandler,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
