import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double height;
  final Color? color;
  const AppButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.width,
    this.height = 50,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(), primary: color),
      ),
    );
  }
}
