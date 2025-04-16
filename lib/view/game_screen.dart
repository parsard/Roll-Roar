import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roll_roar/viewmodel/game_view_model.dart';
import 'package:roll_roar/widgets/button.dart';
import 'package:roll_roar/widgets/dice.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameViewModel>(
      builder: (context, gameViewModel, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Dice(diceNumber: gameViewModel.diceValue), // Displays SVG for current dice value
              const SizedBox(height: 20),
              Button(
                text: 'Roll Dice',
                onPressed: () {
                  gameViewModel.rollDice(); // Rolls the dice and triggers UI update
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
