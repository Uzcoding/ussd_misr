import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'package:ussd_misr/app/app.dart';
import 'package:ussd_misr/app/constants/languages.dart';

import 'package:ussd_misr/translations/locale_keys.g.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final InAppReview inAppReview = InAppReview.instance;

  String currentLanguage = '';
  int currentLanguageIndex = 0;

  void shareApp() {
    Share.share('https://google.com');
  }

  Future<void> reviewApp() async {
    final isAvailable = await inAppReview.isAvailable();
    log(isAvailable.toString());
    if (isAvailable) {
      inAppReview.requestReview();
    }
  }

  void getCurrentLanguage() {
    final result = languages
        .firstWhere((e) => e.locale.toString() == context.locale.toString());

    currentLanguage = result.languageName;
    currentLanguageIndex = languages.indexOf(result);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() => getCurrentLanguage());
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<AppState>().isDarkMode;

    return ListView(
      physics: const RangeMaintainingScrollPhysics(),
      children: [
        ListTile(
          leading: const Icon(
            Icons.color_lens,
            color: Colors.blueAccent,
          ),
          trailing: Switch.adaptive(
            value: isDarkMode,
            onChanged: (_) => context.read<AppState>().toggleTheme(),
          ),
          title: Text(LocaleKeys.theme.tr()),
          subtitle: Text(
              '${isDarkMode ? LocaleKeys.dark.tr() : LocaleKeys.light.tr()} ${LocaleKeys.mode.tr()}'),
        ),
        ListTile(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                Locale currentLocale = context.locale;

                return StatefulBuilder(
                  builder: (context, setState) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 20.0),
                      Text(
                        LocaleKeys.change_language.tr(),
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 250.0,
                        child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(
                            initialItem: currentLanguageIndex,
                          ),
                          itemExtent: 36,
                          onSelectedItemChanged: (index) {
                            currentLocale = languages[index].locale;
                            setState(() {});
                          },
                          children: List.generate(
                            languages.length,
                            (index) => Text(languages[index].languageName),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0)
                            .copyWith(
                          bottom: 40.0,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {
                              context.setLocale(currentLocale);
                              Navigator.pop(context);
                              getCurrentLanguage();
                            },
                            child: Text(
                              LocaleKeys.save.tr(),
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          leading: const Icon(
            Icons.language,
            color: Colors.blueAccent,
          ),
          title: Text(LocaleKeys.language.tr()),
          subtitle: Text(currentLanguage),
        ),
        ListTile(
          onTap: reviewApp,
          leading: Icon(
            Icons.star,
            color: Colors.yellow.shade800,
          ),
          title: Text(LocaleKeys.rate.tr()),
        ),
        ListTile(
          onTap: shareApp,
          leading: const Icon(
            Icons.share,
            color: Colors.blueAccent,
          ),
          title: Text(LocaleKeys.share.tr()),
        ),
      ],
    );
  }
}

class Language {
  String languageName;
  Locale locale;

  Language({
    required this.languageName,
    required this.locale,
  });
}
