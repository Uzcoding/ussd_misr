import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:ussd_misr/app/ui/screens/screens.dart';

import 'package:ussd_misr/translations/locale_keys.g.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentDestination = 0;

  void onDestinationSelected(int newIndex) {
    _currentDestination = newIndex;

    setState(() {});
  }

  final _tabs = [const HomeTab(), const SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          _currentDestination == 0
              ? LocaleKeys.home.tr()
              : LocaleKeys.settings.tr(),
        ),
      ),
      body: _tabs[_currentDestination],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentDestination,
        onDestinationSelected: onDestinationSelected,
        height: 60.0,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home),
            label: LocaleKeys.home.tr(),
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings),
            label: LocaleKeys.settings.tr(),
          ),
        ],
      ),
    );
  }
}
