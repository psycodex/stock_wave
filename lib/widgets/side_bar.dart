import 'package:flutter/cupertino.dart';

class SideBar extends StatefulWidget {
  final double? startWidth;
  final Widget child;
  final double defaultWidth;

  final bool? isResizable;

  const SideBar({
    super.key,
    required this.child,
    required this.defaultWidth,
    this.startWidth,
    this.isResizable = true,
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}
