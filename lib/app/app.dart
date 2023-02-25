import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';

import 'ui/screens/screens.dart';

class AppState extends ChangeNotifier {
  late bool _isDarkMode;
  final _settingsBox = Hive.box('settings');

  bool get isDarkMode => _isDarkMode;

  AppState() {
    _isDarkMode = _settingsBox.get('isDarkMode', defaultValue: false);
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _settingsBox.put('isDarkMode', _isDarkMode);
    notifyListeners();
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<AppState>().isDarkMode;
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 22.0,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          navigationBarTheme: Theme.of(context).navigationBarTheme.copyWith(
                backgroundColor: Colors.white,
              ),
          iconTheme: const IconThemeData(
            color: Colors.blueAccent,
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
            shadowColor: Colors.white30,
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 22.0,
            ),
          ),
          navigationBarTheme: Theme.of(context).navigationBarTheme.copyWith(
                backgroundColor: Colors.black,
              ),
          scaffoldBackgroundColor: Colors.black,
        ),
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
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
