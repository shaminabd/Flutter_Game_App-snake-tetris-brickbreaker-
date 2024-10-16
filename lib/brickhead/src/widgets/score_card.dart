// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  ScoreCard({
    super.key,
    required this.score,
    required this.bestScore,
  });

  final ValueNotifier<int> score;
  int bestScore;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: score,
      builder: (context, score, child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Score: $score'.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              // const SizedBox(height: 6),
              Text(
                'Best: $bestScore'.toUpperCase(),
                style: Theme.of(context).textTheme.titleSmall!,
              )
            ],
          ),
        );
      },
    );
  }
}