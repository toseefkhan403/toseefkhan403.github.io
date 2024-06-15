import 'package:flutter/material.dart';

class HoverText extends StatefulWidget {
  final String visibleText;
  final Color textColor;

  const HoverText({
    super.key,
    required this.visibleText,
    required this.textColor,
  });

  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _isHovered
            ? Text(
                widget.visibleText,
                // key: ValueKey('visibleText'),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: widget.textColor,
                    fontSize: MediaQuery.of(context).size.shortestSide,
                    height: 0.8),
                textAlign: TextAlign.left,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
