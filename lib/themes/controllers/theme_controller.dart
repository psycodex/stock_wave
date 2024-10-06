import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_wave/themes/app_colors.dart';
import 'package:stock_wave/themes/model/flex_tones_enum.dart';

/// A ChangeNotifier controller used to control inputs that configures the
/// ColorScheme in ThemeData and ThemeMode.
class ThemeController with ChangeNotifier {
  ThemeController._internal();

  static final ThemeController _instance = ThemeController._internal();

  factory ThemeController() {
    return _instance;
  }

  // ThemeMode _themeMode = ThemeMode.system;
  // ThemeMode _themeMode = ThemeMode.light;
  final ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;
}

final themeProvider = ChangeNotifierProvider<ThemeController>((ref) {
  var themeController = ThemeController();

  return themeController;
});
