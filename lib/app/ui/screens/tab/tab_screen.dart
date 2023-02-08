import 'package:flutter/material.dart';
import 'package:ussd_misr/app/domain/models/operator.dart';
import 'package:ussd_misr/app/ui/screens/screens.dart';
import 'package:ussd_misr/resources/resources.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  static final operatorsList = [
    Operator(name: 'Vodafone', icon: Svgs.vodafone),
    Operator(name: 'We', icon: Svgs.we),
    Operator(name: 'Etisalat', icon: Svgs.etisalat),
    Operator(name: 'Orange', icon: Svgs.orange),
  ];

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
        backgroundColor: Colors.white,
        title: Text(
          _currentDestination == 0 ? 'USSD MISR' : 'Settings',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: _tabs[_currentDestination],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentDestination,
        onDestinationSelected: onDestinationSelected,
        height: 60.0,
        backgroundColor: Colors.white,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
