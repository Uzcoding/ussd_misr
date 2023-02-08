import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'ui/screens/screens.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        theme: ThemeData(
          iconTheme: const IconThemeData(color: Colors.blueAccent),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const TabScreen(),
          '/service': (context) => const ServiceScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
