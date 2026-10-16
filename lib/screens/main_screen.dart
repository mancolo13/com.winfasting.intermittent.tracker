import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'tabs/tab1_screen.dart';
import 'tabs/tab2_screen.dart';
import 'tabs/tab3_screen.dart';
import 'tabs/tab4_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Tab1Screen(),
    Tab3Screen(),
    Tab2Screen(),
    Tab4Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        backgroundColor: AppTheme.surfaceColor,
        indicatorColor: AppTheme.primaryColor.withValues(alpha: 0.2),
        destinations: [
        NavigationDestination(
          icon: const Icon(Icons.hourglass_top_outlined),
          selectedIcon: const Icon(Icons.hourglass_full, color: AppTheme.primaryColor),
          label: 'Fast',
        ),
        NavigationDestination(
          icon: const Icon(Icons.track_changes_outlined),
          selectedIcon: const Icon(Icons.track_changes, color: AppTheme.primaryColor),
          label: 'Stages',
        ),
        NavigationDestination(
          icon: const Icon(Icons.water_drop_outlined),
          selectedIcon: const Icon(Icons.water_drop, color: AppTheme.primaryColor),
          label: 'Hydrate',
        ),
        NavigationDestination(
          icon: const Icon(Icons.history_outlined),
          selectedIcon: const Icon(Icons.history, color: AppTheme.primaryColor),
          label: 'History',
        ),
        ],
      ),
    );
  }
}
