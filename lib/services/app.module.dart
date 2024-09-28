import 'package:injectable/injectable.dart';
import 'package:stock_wave/routing/router.dart';
import 'package:stock_wave/services/api_service.dart';

@module
abstract class AppModule {
  // @preResolve
  // Future<FirebaseService> get fireService async => await FirebaseService.init();

  // @injectable
  // Stream<User?> get user => auth.authStateChanges();

  // @preResolve
  // Future<UnityService> get unityService => UnityService.init();

  // @preResolve
  // Future<SharedPreferences> get prefs async =>
  //     await SharedPreferences.getInstance();

  // @injectable
  // FirebaseFirestore get store => FirebaseFirestore.instance;

  // @injectable
  // FirebaseAuth get auth => FirebaseAuth.instance;

  // @injectable
  // FirebaseMessaging get messaging => FirebaseMessaging.instance;

  // @injectable
  // FirebaseRemoteConfig get config => FirebaseRemoteConfig.instance;

  // @injectable
  // FirebaseAnalytics get analytics => FirebaseAnalytics.instance;

  // @injectable
  // FirebaseStorage get storage => FirebaseStorage.instance;

  @injectable
  AppRouter get appRouter => AppRouter();

  // @injectable
  // BehaviorSubject<RoutineLogsIsar> get routineLogSubject =>
  //     BehaviorSubject<RoutineLogsIsar>();

  // @preResolve
  // Future<IsarDb> get isar async => await getIsar();

  @injectable
  ApiService get apiService => ApiService();

// @preResolve
// Logger get logger => Logger(
//   printer: PrettyPrinter(colors: true, printTime: true),
// );

// @preResolve
// Future<NotificationService> get notificationService async =>
//     await NotificationService.init();
}
