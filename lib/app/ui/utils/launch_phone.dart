import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchPhoneDialer(String contactNumber) async {
  final result = 'tel:${Uri.encodeComponent(contactNumber)}}';
  try {
    await launchUrl(Uri.parse(result));
  } catch (error) {
    debugPrint(error.toString());
  }
}
