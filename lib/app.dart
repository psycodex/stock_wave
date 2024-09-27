import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_wave/routing/router.dart';
import 'package:stock_wave/themes/controllers/theme_controller.dart';
import 'package:stock_wave/themes/model/app_theme.dart';

import 'api/health.pbgrpc.dart';
import 'client/client.dart';
import 'constants.dart';
import 'injection.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  final _appRouter = locator<AppRouter>();
  var themeMode = ThemeMode.system;
  late ThemeController controller;

  @override
  void initState() {
    controller = ref.read(themeProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(
          // deepLinkBuilder: (deepLink) {
          //   return DeepLink.defaultPath;
          // },
          // navigatorObservers: () => [observer],
          ),
      title: APP_TITLE,
      // themeMode: controller.themeMode,
      theme: AppTheme.light(controller),
      darkTheme: AppTheme.dark(controller),
      // highContrastTheme: AppTheme.highContrastLight(controller),
      // highContrastDarkTheme: AppTheme.highContrastDark(controller),
    );
  }
}
