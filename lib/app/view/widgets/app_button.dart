import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final Color? color;
  final Widget child;
  final double? height;
  final double? width;
  final Function() onTap;

  const AppButton(
      {super.key,
      required this.child,
      required this.onTap,
      this.color = Colors.red,
      this.height = 24,
      this.width = 24});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  double padding = 4;
  bool isHovering = false;
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      child: MouseRegion(
        onEnter: (_) => setState(() {
          isHovering = true;
        }),
        onExit: (_) => setState(() {
          isHovering = false;
        }),
        child: InkWell(
          onTapDown: (_) {
            setState(() {
              isTapped = true;
            });
          },
          onTap: () {
            setState(() {
              isTapped = !isTapped;
            });
            widget.onTap();
          },
          onTapCancel: () {
            setState(() {
              isTapped = false;
            });
          },
          hoverColor: Colors.blue[100],
          splashColor: Colors.blue[400],
          highlightColor: Colors.blue[400],
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color:Color(0x7A56A8EA)
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
