import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ussd_misr/app/ui/screens/screens.dart';

import 'widgets/widgets.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: List.generate(
            TabScreen.operatorsList.length,
            (index) => SizedBox(
              width: 43.w,
              height: 23.h,
              child: OperatorCard(operatorData: TabScreen.operatorsList[index]),
            ),
          ),
        ),
      ),
    );
  }
}
