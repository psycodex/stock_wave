import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stock_wave/api/api.pb.dart';
import 'package:stock_wave/api/service.pbgrpc.dart';
import 'package:stock_wave/client/client.dart';
import 'package:stock_wave/google/protobuf/empty.pb.dart';
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
                    child: Container(
                      color: Colors.white,
                      child: const Center(
                        child: Text('Main Content Area'),
                      ),
                    ),
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
}

Widget getLeftSideBar() {
  return Column(
    children: [
      // Top ListView
      Expanded(
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Top Item $index'),
            );
          },
        ),
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
    future: listIndices(),
    builder: (context, AsyncSnapshot<List<Indices>> snapshot) {
      if (snapshot.hasData) {
        if (snapshot.data!.isNotEmpty) {
          var indices = snapshot.data!;
          return ListView.builder(
            itemCount: indices.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var indice = indices[index];
              return Text(indice.symbol);
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

Future<List<Indices>> listIndices() async {
  var client = StockWaveServiceClient(getClientChannel());
  var request = Empty();

  var r = await client.listIndices(request);
  return r.indices;
}
