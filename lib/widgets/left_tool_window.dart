import 'package:flutter/material.dart';
import 'package:stock_wave/widgets/rounded_icon.dart';

class LeftToolWindow extends StatefulWidget {
  int selectedIndex;

  LeftToolWindow({super.key, required this.selectedIndex});

  @override
  State<LeftToolWindow> createState() => _LeftToolWindowState();
}

class _LeftToolWindowState extends State<LeftToolWindow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            RoundedIconContainer(
              icon: Icons.home,
              background: widget.selectedIndex == 0,
              onPressed: () => onButtonPressed(0),
            ),
            RoundedIconContainer(
              icon: Icons.search,
              background: widget.selectedIndex == 1,
              onPressed: () => onButtonPressed(1),
            ),
            RoundedIconContainer(
              icon: Icons.settings,
              background: widget.selectedIndex == 2,
              onPressed: () => onButtonPressed(2),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Column(
            children: [
              RoundedIconContainer(
                  icon: Icons.info,
                  background: widget.selectedIndex == 3,
                  onPressed: () => onButtonPressed(3)),
              RoundedIconContainer(
                  icon: Icons.help,
                  background: widget.selectedIndex == 4,
                  onPressed: () => onButtonPressed(4)),
              RoundedIconContainer(
                  icon: Icons.logout,
                  background: widget.selectedIndex == 5,
                  onPressed: () => onButtonPressed(5)),
            ],
          ),
        ),
      ],
    );
  }

  onButtonPressed(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }
}
