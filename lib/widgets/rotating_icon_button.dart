import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class RotatingIconButton extends StatefulWidget {
  final Function() onPressed;
  final bool isLeft;

  const RotatingIconButton(
      {super.key, required this.onPressed, this.isLeft = false});

  @override
  State<RotatingIconButton> createState() => _RotatingIconButtonState();
}

class _RotatingIconButtonState extends State<RotatingIconButton> {
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: turns,
      duration: Duration(milliseconds: widget.isLeft ? 500 : 900),
      child: IconButton(
          padding: const EdgeInsets.all(20),
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            widget.onPressed();
            setState(() {
              turns += widget.isLeft ? -1 / 4 : 1 / 4;
            });
          },
          icon: Icon(
            FeatherIcons.plus,
            size: 32,
            color: Colors.white.withOpacity(0.9),
          )),
    );
  }
}
