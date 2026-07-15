import 'package:birthday_calendar/features/all_birthdays/presentation/all_birthdays_screen.dart';
import 'package:birthday_calendar/features/home/presentation/home_screen.dart';
import 'package:birthday_calendar/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final pages = [
    HomeScreen(),
    AllBirthdaysScreen(),
    Center(child: Text('Настройки')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,

        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.main_title,
          ),

          NavigationDestination(
            icon: Icon(Icons.cake_outlined),
            selectedIcon: Icon(Icons.cake),
            label: AppLocalizations.of(context)!.main_all_birthdays,
          ),

          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: AppLocalizations.of(context)!.main_tab_settings,
          ),
        ],
      ),
    );
  }
}
