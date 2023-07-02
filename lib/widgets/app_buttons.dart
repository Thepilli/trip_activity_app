import 'package:cubit_app/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final String? text;
  final IconData? icon;
  final Color backgroundColor;
  final Color borderColor;
  final double size;
  final bool? isIcon;

  const AppButtons({
    super.key,
    this.text = 'Hi',
    this.isIcon = false,
    this.icon,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: isIcon == false ? Center(child: AppText(text: text!, color: color)) : Center(child: Icon(icon, color: color)),
    );
  }
}
