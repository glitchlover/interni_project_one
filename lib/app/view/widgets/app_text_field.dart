import 'package:flutter/material.dart';

import 'app_icon_button.dart';

class AppTextField extends TextField {
  final String label;
  final String? helperText;
  final IconData? prefix;
  final void Function()? onPrefixPressed;
  final IconData? suffix;
  final void Function()? onSuffixPressed;
  final Color? color;

  @override
  Color? get cursorColor => Colors.blueGrey[400];

  @override
  InputDecoration? get decoration {
    var inputDecoration2 = InputDecoration(
      label: Text(
        label,
      ),
      labelStyle: const TextStyle(color: Colors.grey),
      helperText:
          (helperText == "") || (helperText == "null") ? null : helperText,
      helperStyle: const TextTheme().labelMedium,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      prefixIcon: _buildIcon(prefix, onPrefixPressed),
      suffixIcon: _buildIcon(suffix, onSuffixPressed),
      suffixStyle: TextStyle(color: Colors.grey[200]),
      fillColor: Colors.grey[300],
      hoverColor: Colors.blueGrey[100],
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      filled: true,
    );
    var inputDecoration = inputDecoration2;
    return inputDecoration;
  }

  const AppTextField({
    super.key,
    required this.label,
    this.helperText,
    this.prefix,
    this.onPrefixPressed,
    this.suffix,
    this.onSuffixPressed,
    super.keyboardType,
    super.obscureText,
    super.onChanged,
    super.controller,
    super.style,
    this.color,
  });

  _buildIcon(IconData? icon, void Function()? onPressed) {
    return icon == null
        ? null
        : (onPressed == null)
            ? Icon(icon, color: Colors.blueGrey)
            : AppIconButton(
                    icon: icon, color: Colors.blueGrey, onPressed: onPressed)
                .paint();
  }
}
