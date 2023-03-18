import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:ussd_misr/app/domain/models/internet_bundle.dart';

import 'package:ussd_misr/translations/locale_keys.g.dart';

import 'tariff_group.dart';

class OperatorInternetCard extends StatelessWidget {
  const OperatorInternetCard({
    Key? key,
    required this.operatorColor,
    required this.data,
  }) : super(key: key);

  final InternetBundle data;
  final Color operatorColor;

  Future<void> launchPhoneDialer(String contactNumber) async {
    final result = 'tel://$contactNumber';
    try {
      await launchUrlString(result);
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                data.name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: operatorColor,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TariffInfoGroup(
              info: '${LocaleKeys.collection.tr()} ${LocaleKeys.price.tr()}',
              price: data.price.toString(),
              operatorColor: operatorColor,
            ),
            TariffInfoGroup(
              info: LocaleKeys.traffic_volume.tr(),
              price: data.internetTraffic.toString(),
              symbol: 'MB',
              operatorColor: operatorColor,
            ),
            TariffInfoGroup(
              info: LocaleKeys.validity_period.tr(),
              price: data.period.toString(),
              symbol: data.periodString,
              operatorColor: operatorColor,
            ),
            const SizedBox(height: 25.0),
            SizedBox(
              width: double.infinity,
              height: 46.0,
              child: ElevatedButton(
                onPressed: () => launchPhoneDialer(data.code),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  backgroundColor: operatorColor,
                ),
                child: Text(
                  LocaleKeys.connect.tr(),
                  style: const TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
