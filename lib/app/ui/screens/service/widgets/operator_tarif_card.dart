import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:ussd_misr/app/domain/models/tariff.dart';
import 'package:ussd_misr/app/ui/utils/launch_phone.dart';

import 'package:ussd_misr/translations/locale_keys.g.dart';

import 'tariff_group.dart';

class OperatorTariffCard extends StatelessWidget {
  const OperatorTariffCard({
    Key? key,
    required this.operatorColor,
    required this.data,
  }) : super(key: key);

  final Tariff data;
  final Color operatorColor;

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
              symbol: data.internetTrafficMeasure,
              operatorColor: operatorColor,
            ),
            TariffInfoGroup(
              info: LocaleKeys.validity_period.tr(),
              price: '1',
              symbol: LocaleKeys.month.tr(),
              operatorColor: operatorColor,
            ),
            if (data.bonus != null) ...[
              const SizedBox(height: 15.0),
              Text(
                'Bonuslar: ${data.bonus?.join(', ')}',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: operatorColor,
                ),
              ),
            ],
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
