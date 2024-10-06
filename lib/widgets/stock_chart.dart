import 'package:flutter/material.dart';
import 'package:k_chart_plus/k_chart_plus.dart';

class StockChart extends StatefulWidget {
  final List<KLineEntity>? data;

  const StockChart({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _StockChartState();
}

class _StockChartState extends State<StockChart> {
  final MainState _mainState = MainState.MA;
  ChartStyle chartStyle = ChartStyle();
  ChartColors chartColors = ChartColors();
  final bool _volHidden = false;
  final List<SecondaryState> _secondaryStateLi = [SecondaryState.RSI];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Stack(
          children: [
            KChartWidget(
              widget.data,
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
