import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  StackRouter? router;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    this.router = router;

    resolver.next(true);
  }
}
