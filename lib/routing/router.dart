import 'package:auto_route/auto_route.dart';
import 'package:stock_wave/middleware/auth_guard.dart';
import 'package:stock_wave/routing/router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
        page: HomeScreen.page,
        path: '/',
        children: const [],
        guards: [AuthGuard()]),
  ];
}
