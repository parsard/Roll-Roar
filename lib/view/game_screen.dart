import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roll_roar/viewmodel/game_view_model.dart';
import 'package:roll_roar/widgets/button.dart';
import 'package:roll_roar/widgets/dice.dart';
import 'package:roll_roar/widgets/animal_choice.dart';
import 'package:roll_roar/widgets/score_show.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GameViewModel>(
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
                const SizedBox(height: 20),
                if (gameViewModel.state == GameState.running)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 2; i++)
                            AnimalChoice(
                              animal: gameViewModel.choises[i],
                              onTap: () => gameViewModel.selectAnimal(gameViewModel.choises[i]),
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 2; i < 4; i++)
                            AnimalChoice(
                              animal: gameViewModel.choises[i],
                              onTap: () => gameViewModel.selectAnimal(gameViewModel.choises[i]),
                            ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Button(text: 'Reset game', onPressed: () => gameViewModel.resetGame()),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ScoreShow(text: 'win', score: gameViewModel.correctCount),
                          const SizedBox(width: 20),
                          ScoreShow(text: 'lose', score: gameViewModel.wrongCount),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
