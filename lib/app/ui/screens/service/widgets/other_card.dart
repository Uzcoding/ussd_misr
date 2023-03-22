import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ussd_misr/app/domain/models/other_data.dart';
import 'package:ussd_misr/app/ui/utils/launch_phone.dart';

class OtherCard extends StatelessWidget {
  const OtherCard({
    Key? key,
    required this.operatorColor,
    required this.data,
  }) : super(key: key);

  final Color operatorColor;
  final Other data;

  String getCurrentLanguageName(Locale currentLocale) {
    switch (currentLocale.toString()) {
      case 'ru':
        return data.nameRu;
      case 'uz':
        return data.nameUz;
      case 'uz_cyrilic':
        return data.nameUzCrylic;
      case 'ar':
        return data.nameAr;

      default:
        return data.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = getCurrentLanguageName(context.locale);
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
            onPressed: () => launchPhoneDialer(data.code),
            icon: Icon(
              Icons.phone,
              color: operatorColor,
            ),
          ),
        ],
      ),
    );
  }
}
