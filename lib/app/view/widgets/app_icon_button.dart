import 'package:flutter/material.dart';

class AppIconButton extends InkWell {
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;
  final double size;
  final EdgeInsetsGeometry? padding;

  EdgeInsetsGeometry get _padding => padding ?? const EdgeInsets.all(0.0);

  const AppIconButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.color,
      this.size = 20.0,
      this.padding});

  Widget paint() {
    return Padding(
      padding: _padding,
      child: InkWell(
        onTap: onPressed,
        child: Icon(
          icon,
          color: color,
          size: size,
        ),
        // color: color,
      ),
    );
  }
}
