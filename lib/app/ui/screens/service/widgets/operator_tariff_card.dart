import 'package:flutter/material.dart';

import 'tariff_group.dart';

class OperatorTariffCard extends StatelessWidget {
  const OperatorTariffCard({
    Key? key,
    required this.operatorColor,
  }) : super(key: key);

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
                'To\'plam 4 MB',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: operatorColor,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TariffInfoGroup(
              info: 'To\'plam narxi',
              price: '400',
              operatorColor: operatorColor,
            ),
            TariffInfoGroup(
              info: 'Berilgan trafik hajmi',
              price: '4',
              symbol: 'MB',
              operatorColor: operatorColor,
            ),
            TariffInfoGroup(
              info: 'Amal qilish muddati',
              price: '1',
              symbol: 'kun',
              operatorColor: operatorColor,
            ),
            const SizedBox(height: 25.0),
            SizedBox(
              width: double.infinity,
              height: 46.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  backgroundColor: operatorColor,
                ),
                child: const Text(
                  'Connect',
                  style: TextStyle(
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
