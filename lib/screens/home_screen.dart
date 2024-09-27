import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stock_wave/widgets/bottom_tool_window.dart';
import 'package:stock_wave/widgets/left_tool_window.dart';
import 'package:stock_wave/widgets/main_content_area.dart';
import 'package:stock_wave/widgets/right_tool_window.dart';
import 'package:stock_wave/widgets/side_bar.dart';
import 'package:stock_wave/widgets/top_tool_window.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  late final searchFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top tool window
          Container(
            height: 30,
            child: TopToolWindow(),
          ),
          Expanded(
            child: Row(
              children: [
                // Left tool window
                Container(
                  width: 30,
                  child: LeftToolWindow(),
                ),
                // Main content area
                Expanded(
                  child: Container(
                    child: MainContentArea(
                      sidebar: SideBar(
                        defaultWidth: 200,
                        child: Container(
                          color: Colors.blue,
                          child: const Center(
                            child: Text('Left Sidebar'),
                          ),
                        ),
                      ),
                      endSidebar: SideBar(
                        defaultWidth: 200,
                        child: Container(
                          color: Colors.red,
                          child: const Center(
                            child: Text('End Sidebar'),
                          ),
                        ),
                      ),
                      child: Container(
                        color: Colors.white,
                        child: const Center(
                          child: Text('Main Content Area'),
                        ),
                      ),
                    ),
                  ),
                ),
                // Right tool window
                Container(
                  width: 30,
                  child: RightToolWindow(),
                ),
              ],
            ),
          ),
          // Bottom tool window
          Container(
            height: 30,
            child: BottomToolWindow(),
          ),
        ],
      ),
    );
  }
}

// MainContentArea(
// sidebar: Sidebar(
// top: Container(),
// defaultWidth: 0,
// builder: (context, scrollController) {
// return Container();
// },
// bottom: const macos_ui.MacosListTile(
// leading: macos_ui.MacosIcon(
// CupertinoIcons.profile_circled),
// title: Text('Tim Apple'),
// subtitle: Text('tim@apple.com'),
// ),
// ),
// endSidebar: Sidebar(
// startWidth: 200,
// defaultWidth: 200,
// maxWidth: 300,
// shownByDefault: false,
// builder: (context, _) {
// return const Center(
// child: Text('End Sidebar'),
// );
// },
// ),
// child: [
// Container(
// width: 100,
// height: 20,
// color: Colors.red,
// child: Center(
// child: Text('Page 1'),
// ),
// ),
// Container(
// color: Colors.blue,
// child: Center(
// child: Text('Page 2'),
// ),
// ),
// Container(
// color: Colors.green,
// child: Center(
// child: Text('Page 3'),
// ),
// ),
// Container(
// color: Colors.yellow,
// child: Center(
// child: Text('Page 4'),
// ),
// ),
// ][pageIndex],
// )
