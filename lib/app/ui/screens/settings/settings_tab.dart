import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final InAppReview inAppReview = InAppReview.instance;
  bool isDarkMode = false;

  void toggleTheme(bool newValue) {
    isDarkMode = newValue;
    setState(() {});
  }

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
            onChanged: toggleTheme,
          ),
          title: const Text('Theme'),
          subtitle: const Text('Light mode'),
        ),
        const ListTile(
          leading: Icon(
            Icons.language,
            color: Colors.blueAccent,
          ),
          title: Text('Language'),
          subtitle: Text('English'),
        ),
        ListTile(
          onTap: reviewApp,
          leading: Icon(
            Icons.star,
            color: Colors.yellow.shade800,
          ),
          title: const Text('Rate app'),
        ),
        ListTile(
          onTap: shareApp,
          leading: const Icon(
            Icons.share,
            color: Colors.blueAccent,
          ),
          title: const Text('Share'),
        ),
      ],
    );
  }
}
