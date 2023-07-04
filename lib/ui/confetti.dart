import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Confetti extends StatelessWidget {
  final ConfettiController confettiController;
  const Confetti({super.key, required this.confettiController});

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: confettiController,
      blastDirectionality: BlastDirectionality.explosive,
      shouldLoop: false,
      colors: const [
        Colors.red,
        Colors.green,
        Colors.blue,
        Colors.yellow,
      ],
      // Customize other properties as desired
    );
  }
}
