import 'package:flutter/material.dart';
import 'package:ussd_misr/app/data/mock/vodafone_data.dart';

import 'widgets/widgets.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  Color getOperatorColor(String operatorName) {
    switch (operatorName.toLowerCase()) {
      case 'vodafone':
        return const Color(0xFFE60012);
      case 'we':
        return const Color(0xFF5C2F87);
      case 'etisalat':
        return const Color(0xFF789904);
      default:
        return const Color(0xFFFF6600);
    }
  }

  @override
  Widget build(BuildContext context) {
    final operatorName = ModalRoute.of(context)!.settings.arguments as String;
    final operatorColor = getOperatorColor(operatorName);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: operatorColor,
        title: Text(
          operatorName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50.0,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 10.0,
                ),
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 10.0),
                itemBuilder: (context, index) => OperatorCategoryButton(
                  activeColor: operatorColor,
                  isActive: index % 2 == 0,
                  text: index == 0 ? 'Tariffs' : 'Internet',
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: VodafoneData.internetBundles.length,
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                ).copyWith(top: 14.0),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15.0),
                itemBuilder: (context, index) => OperatorInternetCard(
                  operatorColor: operatorColor,
                  data: VodafoneData.internetBundles[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
