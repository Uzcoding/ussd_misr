import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ussd_misr/app/app.dart';
import 'package:ussd_misr/app/domain/models/operator.dart';
import 'package:ussd_misr/app/ui/screens/screens.dart';

class OperatorCard extends StatelessWidget {
  const OperatorCard({
    Key? key,
    required this.operatorData,
  }) : super(key: key);

  final Operator operatorData;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<AppState>().isDarkMode;
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ServiceScreen(operatorData: operatorData),
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor:
            isDarkMode ? Colors.white.withOpacity(.9) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SvgPicture.asset(
          operatorData.icon,
        ),
      ),
    );
  }
}
