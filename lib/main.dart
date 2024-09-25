import 'package:flutter/material.dart';

import 'app.dart';
import 'client/init_py.dart';
import 'injection.dart';

Future<void> pyInitResult = Future(() => null);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  pyInitResult = initPy();
  runApp(const App());
}
