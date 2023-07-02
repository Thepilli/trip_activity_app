import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final TextAlign? align;

  const AppText({Key? key, this.size = 16, required this.text, this.color = Colors.black54, this.align}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align, // Text alignment
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
