import 'package:flutter/material.dart';

class TariffInfoGroup extends StatelessWidget {
  const TariffInfoGroup({
    Key? key,
    required this.info,
    required this.price,
    this.symbol = 'EGP',
    required this.operatorColor,
  }) : super(key: key);

  final String info;
  final String price;
  final String symbol;
  final Color operatorColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            info,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: price,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: operatorColor,
                  ),
                ),
                TextSpan(
                  text: ' $symbol',
                ),
              ],
            ),
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
