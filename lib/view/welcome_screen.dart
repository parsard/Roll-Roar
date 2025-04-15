import 'package:flutter/material.dart';
import 'package:roll_roar/view/game_screen.dart';
import 'package:roll_roar/viewmodel/game_view_model.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Roll & Roar', style: TextStyle(fontSize: 24, color: Colors.white)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the game screen
                Provider.of<GameViewModel>(context, listen: false).startGame();

                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => GameScreen()));
              },
              child: const Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}
