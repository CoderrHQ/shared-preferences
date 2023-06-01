import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.value,
  });

  final int value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            strokeWidth: 12,
            value: value / 30,
            backgroundColor: Colors.white,
            color: Colors.lightBlue,
          ),
          Center(
            child: Text(
              value.toInt().toString(),
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
