import 'package:api_integration/features/home/presentation/home_page.dart';
import 'package:api_integration/features/shared/presentation/main_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_routes.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'rootNavigatorKey');

/// [HomePage] screen route name.
const String homePage = '/';

/// The last location of goRouter.
String? lastRedirect = homePage;

/// GoRouter instance.
@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final router = GoRouter(
    initialLocation: lastRedirect,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navShell,
        ) {
          // the UI shell
          return Main(navShell: navShell);
        },
        branches: [
          StatefulShellBranch(
            routes: <RouteBase>[
              // top route inside branch
              GoRoute(
                path: homePage,
                builder: (BuildContext context, GoRouterState state) =>
                    const HomePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  return router;
}

void goBranch(int index, StatefulNavigationShell navigationShell) {
  navigationShell.goBranch(
    index,
    // A common pattern when using bottom navigation bars is to support
    // navigating to the initial location when tapping the item that is
    // already active. This example demonstrates how to support this behavior,
    // using the initialLocation parameter of goBranch.
    initialLocation: index == navigationShell.currentIndex,
  );
}

class NavigationBranchDetail {
  const NavigationBranchDetail(
    this.label,
    this.icon,
    this.selectedIcon,
  );
  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

class ActionsDetail {
  const ActionsDetail({
    required this.label,
    required this.icon,
    required this.onPressed,
  });
  final String label;
  final Icon icon;
  final void Function() onPressed;
}
