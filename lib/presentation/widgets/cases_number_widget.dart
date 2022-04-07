import 'package:flutter/material.dart';

class CasesNumberWidget extends StatelessWidget {
  final String mainTitle;
  final numOfCases;
  final Color color;
  // ignore: use_key_in_widget_constructors
  const CasesNumberWidget({
    required this.mainTitle,
    required this.numOfCases,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mainTitle,
              style: TextStyle(
                color: color,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '$numOfCases',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
