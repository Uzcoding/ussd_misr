import 'package:flutter/material.dart';

class OperatorCategoryButton extends StatelessWidget {
  const OperatorCategoryButton({
    Key? key,
    this.onPressed,
    this.isActive = false,
    required this.activeColor,
    this.text = 'Tariifs',
  }) : super(key: key);

  final VoidCallback? onPressed;
  final bool isActive;
  final Color activeColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {},
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 2.0,
        ),
        decoration: BoxDecoration(
          color: isActive ? activeColor : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
