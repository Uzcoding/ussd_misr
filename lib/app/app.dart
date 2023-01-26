import 'package:flutter/material.dart';
import 'package:ussd_misr/app/ui/screens/home/home_screen.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const HomeScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
