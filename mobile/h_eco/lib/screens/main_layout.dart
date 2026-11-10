import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/navigation/bottom_navigation.dart';

class MainLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainLayout({
    super.key,
    required this.navigationShell,
  });

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: navigationShell,

        bottomNavigationBar: BottomNavigation(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex
            );
          }
        ),
      );
    }
}
