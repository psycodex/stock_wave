import 'package:flutter/material.dart';

class TopToolWindow extends StatefulWidget {
  const TopToolWindow({super.key});

  @override
  State<TopToolWindow> createState() => _TopToolWindowState();
}

class _TopToolWindowState extends State<TopToolWindow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue[100],
      child: const Center(child: Text('Top Tool Window')),
    );
  }
}
