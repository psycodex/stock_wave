import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:stock_wave/platform_menus.dart';
import 'package:stock_wave/routing/router.dart';
import 'package:stock_wave/themes/controllers/theme_controller.dart';
import 'package:stock_wave/themes/model/app_theme.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:macos_ui/macos_ui.dart' as macos;

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
    var routerDelegate = _appRouter.delegate();
    var routeInformationParser = _appRouter.defaultRouteParser();
    var lightTheme = AppTheme.light(controller);
    var darkTheme = darculaTheme; // AppTheme.dark(controller);

    if (defaultTargetPlatform == TargetPlatform.windows) {
      return fluent.FluentApp.router(
        routerDelegate: routerDelegate,
        routeInformationParser: routeInformationParser,
        title: APP_TITLE,
        themeMode: controller.themeMode,
      );
    } else if (defaultTargetPlatform == TargetPlatform.macOS) {
      return macos.MacosApp.router(
        routerDelegate: routerDelegate,
        routeInformationParser: routeInformationParser,
        title: APP_TITLE,
        themeMode: controller.themeMode,
      );
    } else {
      return MaterialApp.router(
        routerDelegate: routerDelegate,
        routeInformationParser: routeInformationParser,
        title: APP_TITLE,
        themeMode: controller.themeMode,
        theme: lightTheme,
        darkTheme: darkTheme,
      );
    }
  }
}
