import 'package:flutter/material.dart';
import 'package:ussd_misr/app/ui/screens/screens.dart';

final languages = [
  Language(
    languageName: 'Uzbekcha',
    locale: const Locale('uz'),
  ),
  Language(
    languageName: 'Узбекча',
    locale: const Locale.fromSubtags(languageCode: 'uz', scriptCode: 'cyrilic'),
  ),
  Language(
    languageName: 'العربية',
    locale: const Locale('ar'),
  ),
  Language(
    languageName: 'English',
    locale: const Locale('en'),
  ),
  Language(
    languageName: 'Русский',
    locale: const Locale('ru'),
  ),
];
