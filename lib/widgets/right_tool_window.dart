import 'package:flutter/material.dart';

class RightToolWindow extends StatefulWidget {
  const RightToolWindow({super.key});

  @override
  State<RightToolWindow> createState() => _RightToolWindowState();
}

class _RightToolWindowState extends State<RightToolWindow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      child: const Center(child: Text('Right Tool Window')),
    );
  }
}
