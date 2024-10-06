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
import 'package:stock_wave/services/api_service.dart';
import 'package:stock_wave/utils/utils.dart';
import 'package:stock_wave/widgets/bottom_tool_window.dart';
import 'package:stock_wave/widgets/left_tool_window.dart';
import 'package:stock_wave/widgets/loading_widget.dart';
import 'package:stock_wave/widgets/main_content_area.dart';
import 'package:stock_wave/widgets/right_tool_window.dart';
import 'package:stock_wave/widgets/side_bar.dart';
import 'package:stock_wave/widgets/stock_chart.dart';
import 'package:stock_wave/widgets/top_tool_window.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _apiService = locator<ApiService>();
  String indexSymbol = 'NIFTY 50';
  String stockSymbol = '';
  List<KLineEntity>? datas;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                    child: MainContentArea(
                      sidebar: SideBar(
                        defaultWidth: 400,
                        child: Container(
                          // color: Colors.blue,
                          child: getLeftSideBar(),
                        ),
                      ),
                      // endSidebar: SideBar(
                      //   defaultWidth: 200,
                      //   child: Container(
                      //     color: Colors.red,
                      //     child: const Center(
                      //       child: Text('End Sidebar'),
                      //     ),
                      //   ),
                      // ),
                      child: getChart(),
                    ),
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

  Widget getLeftSideBar() {
    return Column(
      children: [
        // Top ListView
        Expanded(
          child: getIndicesStocks(indexSymbol),
        ),
        Divider(
          color: Colors.black,
        ),
        // Bottom ListView
        Expanded(
          child: getIndices(),
        ),
      ],
    );
  }

  Widget getIndices() {
    return FutureBuilder(
      future: _apiService.listIndices(),
      builder: (context, AsyncSnapshot<List<Indices>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            var indices = snapshot.data!;
            return ListView.builder(
              itemCount: indices.length,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                var index = indices[i];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      indexSymbol = index.symbol;
                    });
                  },
                  child: Text(index.symbol),
                );
              },
            );
          } else {
            return Container();
          }
        } else {
          return const Scaffold(
            body: LoadingWidget(),
          );
        }
      },
    );
  }

  Widget getIndicesStocks(String symbol) {
    return FutureBuilder(
      future: _apiService.listIndicesStocks(symbol),
      builder: (context, AsyncSnapshot<List<Stocks>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            var stocks = snapshot.data!;
            return ListView.builder(
              itemCount: stocks.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var stock = stocks[index];
                return GestureDetector(
                  onTap: () async {
                    stockSymbol = stock.symbol;
                    var ohlcvs = await _apiService.getStockData(stockSymbol);
                    setState(() {
                      datas = convertOhlcvsToKLineEntities(ohlcvs);
                      DataUtil.calculate(datas!);
                    });
                  },
                  child: Text(stock.symbol),
                );
              },
            );
          } else {
            return Container();
          }
        } else {
          return const Scaffold(
            body: LoadingWidget(),
          );
        }
      },
    );
  }

  Widget getChart() {
    return StockChart(
      data: datas,
    );
  }
}
