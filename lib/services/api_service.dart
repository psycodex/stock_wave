import 'package:stock_wave/api/api.pb.dart';
import 'package:stock_wave/api/service.pbgrpc.dart';
import 'package:stock_wave/client/client.dart';
import 'package:stock_wave/google/protobuf/empty.pb.dart';

class ApiService {
  Future<List<Indices>> listIndices() async {
    var client = StockWaveServiceClient(getClientChannel());
    var request = Empty();

    var r = await client.listIndices(request);
    return r.indices;
  }

  Future<List<Stocks>> listIndicesStocks(String symbol) async {
    var client = StockWaveServiceClient(getClientChannel());
    var request = ListIndicesStocksRequest(symbol: symbol);

    var r = await client.listIndicesStocks(request);
    return r.stocks;
  }
}
