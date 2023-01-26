import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:ussd_misr/resources/resources.dart';

import 'widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static final operatorsList = [
    Operator(name: 'Vodafone', icon: Svgs.vodafone),
    Operator(name: 'We', icon: Svgs.we),
    Operator(name: 'Etisalat', icon: Svgs.etisalat),
    Operator(name: 'Orange', icon: Svgs.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: const Text(
          'USSD MISR',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: List.generate(
              operatorsList.length,
              (index) => SizedBox(
                width: 43.w,
                height: 23.h,
                child: OperatorCard(operatorData: operatorsList[index]),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
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

class Operator {
  String name;
  String icon;

  Operator({
    required this.name,
    required this.icon,
  });
}
