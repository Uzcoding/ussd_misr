import 'package:flutter/material.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  Color getOperatorColor(String operatorName) {
    switch (operatorName.toLowerCase()) {
      case 'vodafone':
        return const Color(0xFFE60012);
      case 'we':
        return const Color(0xFF5C2F87);
      case 'etisalat':
        return const Color(0xFF789904);
      default:
        return const Color(0xFFFF6600);
    }
  }

  static final tabBar = TabBar(
    isScrollable: true,
    tabs: [
      const Tab(icon: Icon(Icons.looks_one), child: const Text('Tab One')),
      const Tab(icon: Icon(Icons.looks_two), text: 'Tab Two'),
      const Tab(icon: Icon(Icons.looks_3), text: 'Tab Three'),
      const Tab(icon: Icon(Icons.looks_3), text: 'Tab Three'),
      const Tab(icon: Icon(Icons.looks_3), text: 'Tab Three'),
      const Tab(icon: Icon(Icons.looks_3), text: 'Tab Three'),
      const Tab(icon: Icon(Icons.looks_3), text: 'Tab Three'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final operatorName = ModalRoute.of(context)!.settings.arguments as String;

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: getOperatorColor(operatorName),
          title: Text(operatorName),
          bottom: PreferredSize(
            preferredSize: tabBar.preferredSize,
            child: Material(
              color: Colors.white,
              child: tabBar,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
