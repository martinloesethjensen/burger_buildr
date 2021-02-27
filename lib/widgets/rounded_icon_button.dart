import 'package:burger_buildr/helpers/app_constants.dart';
import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({
    required this.icon,
    required this.onPress,
    required this.iconSize,
  });

  final IconData icon;
  final Function? onPress;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: iconSize, height: iconSize),
      elevation: 6.0,
      onPressed: onPress as void Function()?,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(iconSize * 0.2),
      ),
      fillColor: AppConstants.hexToColor(AppConstants.BUTTON_COLOR),
      child: Icon(
        icon,
        color: Colors.white,
        size: iconSize * 0.8,
      ),
    );
  }
}
