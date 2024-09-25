import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isTopPanelOpen = false;
    bool isBottomPanelOpen = false;

    return Scaffold(
      body: Column(
        children: [
          // Top tool window
          Container(
            height: 30,
            color: Colors.blue[100],
            child: Center(child: Text('Top Tool Window')),
          ),
          Expanded(
            child: Row(
              children: [
                // Left tool window
                Container(
                  width: 30,
                  color: Colors.green[100],
                  child: Center(child: Text('Left Tool Window')),
                ),
                // Main content area
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Center(child: Text('Main Content Area')),
                  ),
                ),
                // Right tool window
                Container(
                  width: 30,
                  color: Colors.orange[100],
                  child: Center(child: Text('Right Tool Window')),
                ),
              ],
            ),
          ),
          // Bottom tool window
          Container(
            height: 30,
            color: Colors.red[100],
            child: Center(child: Text('Bottom Tool Window')),
          ),
        ],
      ),
    );
  }
}
