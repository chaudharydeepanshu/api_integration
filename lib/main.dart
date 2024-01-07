import 'package:api_integration/constants/general_contants.dart';
import 'package:api_integration/route/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

bool isInDebugMode = kDebugMode;

/// Key used when building the ScaffoldMessenger.
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  // ensure initialized
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
        useMaterial3: true,
        fontFamily: 'LexendDeca',
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellowAccent, brightness: Brightness.dark),
        useMaterial3: true,
        fontFamily: 'LexendDeca',
      ),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
