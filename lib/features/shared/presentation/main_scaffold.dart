import 'package:api_integration/constants/general_contants.dart';
import 'package:api_integration/features/shared/presentation/widgets/custom_drawer.dart';
import 'package:api_integration/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Main extends StatelessWidget {
  const Main({super.key, required this.navShell});

  final StatefulNavigationShell navShell;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      child: Scaffold(
        body: navShell,
        drawer: CustomDrawer(
          navShell: navShell,
        ),
        appBar: AppBar(
          title: const Text(appName),
          centerTitle: true,
          actions: [
            if (navShell.currentIndex != 0)
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  goBranch(0, navShell);
                },
              ),
          ],
        ),
      ),
    );
  }
}
