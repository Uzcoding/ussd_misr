import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ussd_misr/app/data/mock/operatos_data.dart';

import 'widgets/widgets.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final operators = OperatorsData.operators;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: List.generate(
            operators.length,
            (index) => SizedBox(
              width: 43.w,
              height: 23.h,
              child: OperatorCard(operatorData: operators[index]),
            ),
          ),
        ),
      ),
    );
  }
}
