import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ussd_misr/translations/codegen_loader.g.dart';

import 'app/app.dart';

void main() async {
  await Hive.initFlutter();
  await EasyLocalization.ensureInitialized();
  await Hive.openBox('settings');

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('uz'),
        Locale('ru'),
        Locale('ar'),
        Locale.fromSubtags(languageCode: 'uz', scriptCode: 'cyrilic'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: ChangeNotifierProvider(
        create: (context) => AppState(),
        child: const App(),
      ),
    ),
  );
}
