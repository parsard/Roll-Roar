import 'package:flutter/material.dart';

class ScoreShow extends StatelessWidget {
  final String text;
  final int score;
  const ScoreShow({super.key, required this.text, required this.score});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(width: 14),
            Text('$score', style: const TextStyle(fontSize: 20, color: Color.fromARGB(119, 32, 32, 32))),
          ],
        ),
      ),
    );
  }
}
