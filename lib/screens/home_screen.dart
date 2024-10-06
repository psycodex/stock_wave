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
import 'package:stock_wave/widgets/side_bar.dart';
import 'package:stock_wave/widgets/top_tool_window.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _apiService = locator<ApiService>();
  String symbol = 'NIFTY 50';
  String stock = '';
  ChartStyle chartStyle = ChartStyle();
  ChartColors chartColors = ChartColors();
  List<KLineEntity>? datas;
  final MainState _mainState = MainState.MA;
  final bool _volHidden = false;
  final List<SecondaryState> _secondaryStateLi = [SecondaryState.RSI];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformMenuBar(
      menus: menuBarItems(),
      child: MacosWindow(
        child: Column(
          children: [
            // Top tool window
            SizedBox(
              height: 45,
              child: TopToolWindow(),
            ),
            Expanded(
              child: Row(
                children: [
                  // Left tool window
                  SizedBox(
                    width: 30,
                    child: LeftToolWindow(),
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
            SizedBox(
              height: 30,
              child: BottomToolWindow(),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      body: Column(
        children: [
          // Top tool window
          SizedBox(
            height: 30,
            child: TopToolWindow(),
          ),
          Expanded(
            child: Row(
              children: [
                // Left tool window
                // SizedBox(
                //   width: 30,
                //   child: LeftToolWindow(),
                // ),
                // Main content area
                Expanded(
                  child: MainContentArea(
                    sidebar: SideBar(
                      defaultWidth: 200,
                      child: Container(
                        color: Colors.blue,
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
          SizedBox(
            height: 30,
            child: BottomToolWindow(),
          ),
        ],
      ),
    );
  }

  Widget getLeftSideBar() {
    return Column(
      children: [
        // Top ListView
        Expanded(
          child: getIndicesStocks(symbol),
        ),
        Divider(),
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
                      symbol = index.symbol;
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
                    var ohlcvs = await _apiService.getStockData(stock.symbol);
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Stack(
          children: [
            KChartWidget(
              datas,
              chartStyle,
              chartColors,
              mBaseHeight: height,
              isTrendLine: false,
              mainState: _mainState,
              volHidden: _volHidden,
              secondaryStateLi: _secondaryStateLi.toSet(),
              fixedLength: 2,
              timeFormat: TimeFormat.YEAR_MONTH_DAY,
              maDayList: [5, 10, 20],
              showNowPrice: true,
            )
          ],
        );
      },
    );
  }
}
