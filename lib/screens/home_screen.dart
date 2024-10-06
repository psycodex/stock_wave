import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:k_chart_plus/chart_style.dart';
import 'package:k_chart_plus/entity/k_line_entity.dart';
import 'package:k_chart_plus/k_chart_widget.dart';
import 'package:k_chart_plus/utils/data_util.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:stock_wave/api/api.pb.dart';
import 'package:stock_wave/injection.dart';
import 'package:stock_wave/platform_menus.dart';
import 'package:stock_wave/screens/home_ui.dart';
import 'package:stock_wave/screens/search_ui.dart';
import 'package:stock_wave/services/api_service.dart';
import 'package:stock_wave/widgets/bottom_tool_window.dart';
import 'package:stock_wave/widgets/left_tool_window.dart';
import 'package:stock_wave/widgets/top_tool_window.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String indexSymbol = 'NIFTY 50';
  String stockSymbol = '';
  List<KLineEntity>? datas;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget childWidget;
    switch (selectedIndex) {
      case 0:
        childWidget = HomeUI(selectedIndex: selectedIndex);
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
    setState(() {});
    return PlatformMenuBar(
      menus: menuBarItems(),
      child: MacosWindow(
        child: Column(
          children: [
            // Top tool window
            Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 0.5),
                ),
              ),
              child: TopToolWindow(),
            ),
            Expanded(
              child: Row(
                children: [
                  // Left tool window
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black, width: 0.5),
                        bottom: BorderSide(color: Colors.black, width: 0.5),
                      ),
                    ),
                    child: LeftToolWindow(selectedIndex: selectedIndex),
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
              height: 30,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black, width: 0.5),
                ),
              ),
              child: BottomToolWindow(),
            ),
          ],
        ),
      ),
    );
  }
}
