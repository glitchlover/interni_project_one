import 'package:flutter/material.dart';
import 'package:interni_project_one/app/view/widgets/app_button.dart';

class AppIconAndTextButton extends StatefulWidget {
  final double? width;
  final Function() onTap;
  final String label;
  final IconData icon;
  const AppIconAndTextButton({
    super.key,
    this.width,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<AppIconAndTextButton> createState() => _AppIconAndTextButtonState();
}

class _AppIconAndTextButtonState extends State<AppIconAndTextButton> {
  bool _isConfirmed = false;
  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: () => widget.onTap(),
      color: Colors.blue[200],
      width: widget.width,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 4),
          _isConfirmed
              ? const CircularProgressIndicator()
              : Icon(widget.icon, color: Colors.blue[900]),
          const Spacer(flex: 4),
          Text(
            widget.label,
            style: TextStyle(
                color: Colors.blue[900],
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 3),
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}
