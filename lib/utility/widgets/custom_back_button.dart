import 'package:flutter/material.dart';
import 'package:flutter_model_view/utility/constants.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;
  final Color? backgroundColor;
  final IconData? icon;
  final Function()? onPressed;
  const CustomBackButton(
      {super.key, this.color, this.backgroundColor, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon ?? Icons.arrow_back_ios),
      // color: color ?? Theme.of(context).colorScheme.secondary,
      onPressed: onPressed ??
          () {
            Navigator.of(context).pop();
          },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
            backgroundColor ?? Colors.transparent),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(kDefaultPadding / 2),
        ),
      ),
    );
  }
}
