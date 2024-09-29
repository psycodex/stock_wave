import 'package:flutter/material.dart';

// import 'package:k_chart/entity/k_line_entity.dart';
import 'package:k_chart_plus/entity/k_line_entity.dart';
import 'package:stock_wave/api/api.pb.dart';

bool isDarkTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

List<KLineEntity> convertOhlcvsToKLineEntities(List<Ohlcv> ohlcvs) {
  return ohlcvs.map((e) {
    return KLineEntity.fromCustom(
      open: e.open,
      high: e.high,
      low: e.low,
      close: e.close,
      vol: e.volume,
      amount: e.qtyPerTrade,
      time: dateToUnixTimestamp(e.date),
    );
  }).toList();
}

int dateToUnixTimestamp(String date) {
  DateTime dateTime = DateTime.parse(date);
  return dateTime.millisecondsSinceEpoch;
}
