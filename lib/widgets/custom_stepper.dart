import 'package:flutter/material.dart';

import 'rounded_icon_button.dart';

class CustomStepper extends StatefulWidget {
  CustomStepper({
    required this.lowerLimit,
    required this.upperLimit,
    required this.stepValue,
    required this.iconSize,
    required this.value,
    required this.name,
    required this.addHandler,
    required this.removeHandler,
  });

  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;
  final int value;
  final String? name;
  final Function? addHandler;
  final Function? removeHandler;
  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  late int value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedIconButton(
          icon: Icons.remove,
          iconSize: widget.iconSize,
          onPress: widget.value == widget.lowerLimit
              ? null
              : () {
                  _setValue();
                  widget.removeHandler!();
                },
        ),
        Container(
          width: widget.iconSize,
          child: Text(
            '${widget.value}',
            style: TextStyle(
              fontSize: widget.iconSize * 0.8,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        RoundedIconButton(
          icon: Icons.add,
          iconSize: widget.iconSize,
          onPress: widget.value == widget.upperLimit
              ? null
              : () {
                  _setValue();
                  widget.addHandler!();
                },
        ),
      ],
    );
  }

  _setValue() => setState(() {
        value = widget.value == widget.upperLimit
            ? widget.upperLimit
            : value += widget.stepValue;
      });
}
