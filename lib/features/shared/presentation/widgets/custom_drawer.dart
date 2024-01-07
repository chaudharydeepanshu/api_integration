import 'package:api_integration/constants/general_contants.dart';
import 'package:api_integration/route/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const List<NavigationBranchDetail> destinations = <NavigationBranchDetail>[
  NavigationBranchDetail('Home', Icon(Icons.home_outlined), Icon(Icons.home)),
];

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key, required this.navShell});

  final StatefulNavigationShell navShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationDrawer(
      onDestinationSelected: (int index) {
        goBranch(index, navShell);
      },
      selectedIndex: navShell.currentIndex,
      children: <Widget>[
        const DrawerHeader(
          child: Center(
            child: Text(
              appName,
            ),
          ),
        ),
        ...destinations.map(
          (NavigationBranchDetail destination) {
            return NavigationDrawerDestination(
              label: Text(destination.label),
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
            );
          },
        ),
      ],
    );
  }
}
