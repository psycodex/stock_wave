import 'package:flutter/material.dart';

class LeftToolWindow extends StatefulWidget {
  const LeftToolWindow({super.key});

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
    return Container(
      // color: Colors.green[100],
      child: const Center(child: Text('Left Tool Window')),
    );
  }
}
