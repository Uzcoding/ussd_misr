import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ussd_misr/app/app.dart';
import 'package:ussd_misr/app/constants/strings.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final InAppReview inAppReview = InAppReview.instance;

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
          title: Text(AppStrings.theme),
          subtitle: Text(
              '${isDarkMode ? AppStrings.dark : AppStrings.light} ${AppStrings.mode}'),
        ),
        ListTile(
          leading: const Icon(
            Icons.language,
            color: Colors.blueAccent,
          ),
          title: Text(AppStrings.language),
          subtitle: const Text('English'),
        ),
        ListTile(
          onTap: reviewApp,
          leading: Icon(
            Icons.star,
            color: Colors.yellow.shade800,
          ),
          title: Text(AppStrings.rate),
        ),
        ListTile(
          onTap: shareApp,
          leading: const Icon(
            Icons.share,
            color: Colors.blueAccent,
          ),
          title: Text(AppStrings.share),
        ),
      ],
    );
  }
}
