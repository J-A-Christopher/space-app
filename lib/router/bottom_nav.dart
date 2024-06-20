import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation(
      {super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.other_houses), label: 'Beauty'),
          NavigationDestination(icon: Icon(Icons.rss_feed), label: 'Feed'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          NavigationDestination(icon: Icon(Icons.token), label: 'Token')
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
