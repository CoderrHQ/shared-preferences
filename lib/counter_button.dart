import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
