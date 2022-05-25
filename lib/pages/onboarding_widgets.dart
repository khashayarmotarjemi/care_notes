import 'package:flutter/material.dart';

class OnboardingCardArea extends StatelessWidget {
  const OnboardingCardArea(
      {Key? key, required this.texts, required this.mainArea})
      : super(key: key);
  final List<TextSpan> texts;
  final Widget mainArea;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 48, horizontal: 28),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 28),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 21.0, height: 1.3, color: Colors.grey[600]),
                children: texts,
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [mainArea],
            ))
          ],
        ),
      ),
    );
  }
}
