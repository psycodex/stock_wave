import 'package:flutter/material.dart';

class RoundedIconContainer extends StatelessWidget {
  final IconData icon;
  final double size;
  final double borderRadius;
  final Color backgroundColor;
  final Color iconColor;
  final bool background;
  final VoidCallback? onPressed;

  const RoundedIconContainer({
    super.key,
    required this.icon,
    this.background = false,
    this.size = 40.0,
    this.borderRadius = 7.0,
    this.backgroundColor = const Color(0xFF484A4C),
    this.iconColor = Colors.grey,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: background
          ? BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius))
          : null,
      margin: EdgeInsets.only(top: 5),
      child: IconButton(
        icon: Icon(icon, color: iconColor),
        onPressed: onPressed,
      ),
    );
  }
}