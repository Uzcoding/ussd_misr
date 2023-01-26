import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ussd_misr/app/ui/screens/home/home_screen.dart';

class OperatorCard extends StatelessWidget {
  const OperatorCard({
    Key? key,
    required this.operatorData,
  }) : super(key: key);

  final Operator operatorData;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.white,
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
