import 'package:flutter/material.dart';

import 'main.dart';

class SwitchPage extends StatelessWidget {
  SwitchPage({
    super.key,
    required this.recommendation,
    required this.status,
    required this.bmi,
    required this.onRestart,
  });

  void Function() onRestart;

  String recommendation;
  String status;
  double bmi;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your BMI : ${bmi.toStringAsFixed(1)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: kColorScheme.primaryContainer,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Body Status : $status',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kColorScheme.primaryContainer),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              recommendation,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: kColorScheme.primaryContainer,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: kColorScheme.onSecondaryContainer,
                  foregroundColor: kColorScheme.primaryContainer,
                ),
                onPressed: onRestart,
                child: const Text("Calculate Again"))
          ],
        ),
      ),
    );
  }
}
