import 'package:flutter/material.dart';
import 'package:k_chart_plus/k_chart_plus.dart';
import 'package:k_chart_plus/utils/data_util.dart';
import 'package:stock_wave/api/api.pb.dart';
import 'package:stock_wave/injection.dart';
import 'package:stock_wave/services/api_service.dart';
import 'package:stock_wave/utils/utils.dart';
import 'package:stock_wave/widgets/loading_widget.dart';
import 'package:stock_wave/widgets/main_content_area.dart';
import 'package:stock_wave/widgets/side_bar.dart';
import 'package:stock_wave/widgets/stock_chart.dart';

class HomeUI extends StatefulWidget {
  int selectedIndex;

  HomeUI({super.key, required this.selectedIndex});

  @override
  State<StatefulWidget> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  final _apiService = locator<ApiService>();
  String indexSymbol = 'NIFTY 50';
  String stockSymbol = '';
  List<KLineEntity>? datas;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MainContentArea(
      sidebar: SideBar(
        defaultWidth: 400,
        child: Container(
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
