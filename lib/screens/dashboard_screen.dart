import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:k_chart_plus/entity/k_line_entity.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:stock_wave/config.dart';
import 'package:stock_wave/platform_menus.dart';
import 'package:stock_wave/screens/home_ui.dart';
import 'package:stock_wave/screens/search_ui.dart';
import 'package:stock_wave/widgets/bottom_tool_window.dart';
import 'package:stock_wave/widgets/left_tool_window.dart';
import 'package:stock_wave/widgets/top_tool_window.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String indexSymbol = 'NIFTY 50';
  String stockSymbol = '';
  List<KLineEntity>? data;
  int selectedIndex = 0;
  HomeUI? homeUI;

  @override
  Widget build(BuildContext context) {
    Widget childWidget;
    homeUI ??= HomeUI(selectedIndex: selectedIndex);

    switch (selectedIndex) {
      case 0:
        childWidget = homeUI!;
        break;
      case 1:
        childWidget = SearchUi();
        break;
      case 2:
        childWidget = Container();
        break;
      case 3:
        childWidget = Container();
        break;
      case 4:
        childWidget = Container();
        break;
      case 5:
        childWidget = Container();
        break;
      default:
        childWidget = Container();
        break;
    }
    return PlatformMenuBar(
      menus: menuBarItems(),
      child: MacosWindow(
        child: Column(
          children: [
            // Top tool window
            Container(
              height: 45.0,
              decoration: BoxDecoration(
                border: Border(
                  bottom:
                      BorderSide(color: Colors.black, width: windowBorderSize),
                ),
              ),
              child: TopToolWindow(),
            ),
            Expanded(
              child: Row(
                children: [
                  // Left tool window
                  Container(
                    width: 50.0,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                            color: Colors.black, width: windowBorderSize),
                      ),
                    ),
                    child: LeftToolWindow(
                        selectedIndex: selectedIndex,
                        onIndexChanged: _onIndexChanged),
                  ),
                  // Main content area
                  Expanded(
                    child: childWidget,
                  ),
                  // Right tool window
                  // Container(
                  //   width: 30,
                  //   child: RightToolWindow(),
                  // ),
                ],
              ),
            ),
            // Bottom tool window
            Container(
              height: 30.0,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black, width: windowBorderSize),
                ),
              ),
              child: BottomToolWindow(),
            ),
          ],
        ),
      ),
    );
  }

  void _onIndexChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
